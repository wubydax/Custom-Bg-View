package com.android.wubydax;

import android.content.ContentResolver;
import android.content.Context;
import android.database.ContentObserver;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.os.Handler;
import android.provider.Settings;
import android.util.AttributeSet;
import android.widget.ImageView;

import java.io.FileNotFoundException;
import java.io.InputStream;

/**
 * Created by Roberto Mariani & Anna Berkovitch on 09/06/2016.
 * Custom View for background...
 */
@SuppressWarnings("unused")
public class CustomBg extends ImageView {

    private String URI_KEY = "some_database_key";
    private String OPACITY_KEY = "view_opacity_key";
    private String CROP_KEY = "crop_key";
    private String COLOR_PRIMARY_KEY = "color_primary_database_key";
    private String COLOR_SECONDARY_KEY = "color_secondary_database_key";
    private String GRADIENT_ORIENTATION_KEY = "gradient_orientation_key";
    private String MASTER_SWITCH_KEY = "is_view_enabled";
    private String CUSTOM_BG_TYPE = "gear_custom_bg_type"; //added to replace individual switches for bg types. One ListPreference should be enough I think
    private int mCustomBgType; // takes values 0,1,2 from ListPreference in RC
    private Handler mHandler;
    private CustomViewObserver mCustomViewObserver;
    private Context mContext;
    private ContentResolver mContentResolver;
    private Uri mImageUri;
    private int mOpacity;
    private ScaleType mScaleType;
    private boolean mIsEnabled;
    private int mColorPrimary;
    private int mColorSecondary;

    public CustomBg(Context context, AttributeSet attrs) {
        super(context, attrs);
        mHandler = new Handler();
        mCustomViewObserver = new CustomViewObserver(mHandler);
        mContext = context;
        mContentResolver = context.getContentResolver();
        initValues();
    }

    private void initValues() {
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
        if(mIsEnabled) {
            switch (mCustomBgType) {
                case 0: //Image
                    if (mImageUri != null) {
                        try {
                            InputStream inputStream = mContentResolver.openInputStream(mImageUri);
                            Bitmap bitmap = BitmapFactory.decodeStream(inputStream);
                            drawable = new BitmapDrawable(mContext.getResources(), bitmap);
                        } catch (FileNotFoundException e) {
                            e.printStackTrace();
                        }
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
    protected void onFinishInflate() {
        super.onFinishInflate();
        initView();
    }

    private void initView() {
        Drawable drawable = getMyDrawable();
        drawable.setAlpha(mOpacity);
        setImageDrawable(drawable);
        setScaleType(mScaleType);
    }

    @Override
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        mContentResolver.registerContentObserver(Settings.System.getUriFor(MASTER_SWITCH_KEY), false, mCustomViewObserver);
        mContentResolver.registerContentObserver(Settings.System.getUriFor(CROP_KEY), false, mCustomViewObserver);
        mContentResolver.registerContentObserver(Settings.System.getUriFor(OPACITY_KEY), false, mCustomViewObserver);
        mContentResolver.registerContentObserver(Settings.System.getUriFor(COLOR_PRIMARY_KEY), false, mCustomViewObserver);
        mContentResolver.registerContentObserver(Settings.System.getUriFor(GRADIENT_ORIENTATION_KEY), false, mCustomViewObserver);
        mContentResolver.registerContentObserver(Settings.System.getUriFor(COLOR_SECONDARY_KEY), false, mCustomViewObserver);
        mContentResolver.registerContentObserver(Settings.System.getUriFor(URI_KEY), false, mCustomViewObserver);
        mContentResolver.registerContentObserver(Settings.System.getUriFor(CUSTOM_BG_TYPE), false, mCustomViewObserver);


    }

    @Override
    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        mContentResolver.unregisterContentObserver(mCustomViewObserver);
    }

    public GradientDrawable.Orientation getGradientOrientation() {
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



    private class CustomViewObserver extends ContentObserver {

        public CustomViewObserver(Handler handler) {
            super(handler);
        }

        @Override
        public boolean deliverSelfNotifications() {
            return true;
        }

        @Override
        public void onChange(boolean selfChange, Uri uri) {
            super.onChange(selfChange, uri);
            initValues();
            initView();
        }
    }
}
