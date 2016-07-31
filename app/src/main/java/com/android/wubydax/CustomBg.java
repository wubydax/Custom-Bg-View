package com.android.wubydax;

import android.content.ContentResolver;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.provider.Settings;
import android.util.AttributeSet;
import android.util.Log;
import android.widget.ImageView;

import java.io.FileNotFoundException;
import java.io.InputStream;

/**
 * Created by Roberto Mariani & Anna Berkovitch on 09/06/2016.
 * Custom View for background...
 */
public class CustomBg extends ImageView {

    private static final String LOG_TAG = "daxgirl";
    private String URI_KEY = "gear_bg_image_uri";
    private String OPACITY_KEY = "gear_bg_opacity";
    private String CROP_KEY = "gear_bg_crop_type";
    private String COLOR_PRIMARY_KEY = "gear_bg_primary_color";
    private String COLOR_SECONDARY_KEY = "gear_second_gradient_color";
    private String GRADIENT_ORIENTATION_KEY = "gear_bg_gradient_orientation";
    private String MASTER_SWITCH_KEY = "enable_gear_custom_bg";
    private String CUSTOM_BG_TYPE = "gear_custom_bg_type"; //added to replace individual switches for bg types. One ListPreference should be enough I think
    private int mCustomBgType; // takes values 0,1,2 from ListPreference in RC
    private Context mContext;
    private ContentResolver mContentResolver;
    private Uri mImageUri, mOldUri;
    private int mOpacity;
    private ScaleType mScaleType;
    private boolean mIsEnabled;
    private int mColorPrimary;
    private int mColorSecondary;
    private Drawable mDrawable;


    public CustomBg(Context context, AttributeSet attrs) {
        super(context, attrs);
        mContext = context;
        mContentResolver = context.getContentResolver();
    }

    private void initValues() {
        mOldUri = mImageUri;
        String uriString = Settings.System.getString(mContentResolver, URI_KEY);
        mImageUri = uriString != null && !uriString.equals("") ? Uri.parse(uriString) : null;
        mIsEnabled = Settings.System.getInt(mContentResolver, MASTER_SWITCH_KEY, 1) != 0;
        mOpacity = Settings.System.getInt(mContentResolver, OPACITY_KEY, 255);
        mColorPrimary = Settings.System.getInt(mContentResolver, COLOR_PRIMARY_KEY, Color.WHITE);
        mColorSecondary = Settings.System.getInt(mContentResolver, COLOR_SECONDARY_KEY, Color.CYAN);
        mScaleType = getMyScaleType();
        mCustomBgType = Settings.System.getInt(mContentResolver, CUSTOM_BG_TYPE, 0);
    }

    private ScaleType getMyScaleType() {
        int scaleType = Settings.System.getInt(mContentResolver, CROP_KEY, 0);
        switch (scaleType) {
            case 0:
                return ScaleType.CENTER_CROP;
            case 1:
                return ScaleType.CENTER_INSIDE;
            case 2:
                return ScaleType.FIT_XY;
            default:
                return ScaleType.CENTER_CROP;
        }
    }

    private Drawable getMyDrawable() {
        Drawable drawable = new ColorDrawable(Color.TRANSPARENT); //default
        if (mIsEnabled) {
            switch (mCustomBgType) {
                case 0: //Image
                    Log.d(LOG_TAG, "getMyDrawable image is selected");
                    if (mImageUri != null && !mImageUri.equals(mOldUri)) {
                        try {
                            Log.d(LOG_TAG, "getMyDrawable getting image");
                            InputStream inputStream = mContentResolver.openInputStream(mImageUri);
                            Bitmap bitmap = BitmapFactory.decodeStream(inputStream);
                            drawable = new BitmapDrawable(mContext.getResources(), bitmap);
                            mDrawable = drawable;
                        } catch (FileNotFoundException e) {
                            Log.d(LOG_TAG, "getMyDrawable exception: file not found");
                            e.printStackTrace();
                        }
                    } else {
                        drawable = mDrawable;
                    }
                    break;
                case 1: //Color
                    drawable = new ColorDrawable(mColorPrimary);
                    break;
                case 2: //Gradient
                    drawable = new GradientDrawable(
                            getGradientOrientation(),
                            new int[]{mColorPrimary, mColorSecondary});
                    ((GradientDrawable) drawable).setCornerRadius(0f);
                    break;

            }
        }
        return drawable;
    }

    @Override
    public void onWindowFocusChanged(boolean hasWindowFocus) {
        super.onWindowFocusChanged(hasWindowFocus);
        if (hasWindowFocus && getVisibility() == VISIBLE) {
            initValues();
            initView();
        }
    }

    private void initView() {
        Drawable drawable = getMyDrawable();
        drawable.setAlpha(mOpacity);
        setImageDrawable(drawable);
        setScaleType(mScaleType);
    }


    private GradientDrawable.Orientation getGradientOrientation() {
        int orientation = Settings.System.getInt(mContentResolver, GRADIENT_ORIENTATION_KEY, 0);
        switch (orientation) {
            case 0:
                return GradientDrawable.Orientation.TOP_BOTTOM;
            case 1:
                return GradientDrawable.Orientation.BOTTOM_TOP;
            case 2:
                return GradientDrawable.Orientation.LEFT_RIGHT;
            case 3:
                return GradientDrawable.Orientation.RIGHT_LEFT;
            default:
                return GradientDrawable.Orientation.TOP_BOTTOM;
        }
    }


}
