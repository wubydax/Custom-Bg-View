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
    private static final String URI_KEY = "some_database_key";
    private static final String OPACITY_KEY = "view_opacity_key";
    private static final String CROP_KEY = "crop_key";
    private static final String MASTER_SWITCH_KEY = "is_view_enabled";
    private Handler mHandler;
    private CustomViewObserver mCustomViewObserver;
    private Context mContext;
    private ContentResolver mContentResolver;
    private Uri mImageUri;
    private int mOpacity;
    private ScaleType mScaleType;
    private boolean mIsEnabled;

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
        mScaleType = getMyScaleType();
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
        Drawable drawable = new ColorDrawable(Color.TRANSPARENT);
        if (mImageUri != null && mIsEnabled) {
            try {
                InputStream inputStream = mContentResolver.openInputStream(mImageUri);
                Bitmap bitmap = BitmapFactory.decodeStream(inputStream);
                drawable = new BitmapDrawable(mContext.getResources(), bitmap);
            } catch (FileNotFoundException e) {
                e.printStackTrace();
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
    }

    @Override
    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        mContentResolver.unregisterContentObserver(mCustomViewObserver);
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
