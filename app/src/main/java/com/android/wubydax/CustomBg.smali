.class public Lcom/android/wubydax/CustomBg;
.super Landroid/widget/ImageView;
.source "CustomBg.java"


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "daxgirl"


# instance fields
.field private COLOR_PRIMARY_KEY:Ljava/lang/String;

.field private COLOR_SECONDARY_KEY:Ljava/lang/String;

.field private CROP_KEY:Ljava/lang/String;

.field private CUSTOM_BG_TYPE:Ljava/lang/String;

.field private GRADIENT_ORIENTATION_KEY:Ljava/lang/String;

.field private MASTER_SWITCH_KEY:Ljava/lang/String;

.field private OPACITY_KEY:Ljava/lang/String;

.field private URI_KEY:Ljava/lang/String;

.field private mColorPrimary:I

.field private mColorSecondary:I

.field private mContentResolver:Landroid/content/ContentResolver;

.field private mContext:Landroid/content/Context;

.field private mCustomBgType:I

.field private mDrawable:Landroid/graphics/drawable/Drawable;

.field private mImageUri:Landroid/net/Uri;

.field private mIsEnabled:Z

.field private mOldUri:Landroid/net/Uri;

.field private mOpacity:I

.field private mScaleType:Landroid/widget/ImageView$ScaleType;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 49
    invoke-direct {p0, p1, p2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 28
    const-string v0, "gear_bg_image_uri"

    iput-object v0, p0, Lcom/android/wubydax/CustomBg;->URI_KEY:Ljava/lang/String;

    .line 29
    const-string v0, "gear_bg_opacity"

    iput-object v0, p0, Lcom/android/wubydax/CustomBg;->OPACITY_KEY:Ljava/lang/String;

    .line 30
    const-string v0, "gear_bg_crop_type"

    iput-object v0, p0, Lcom/android/wubydax/CustomBg;->CROP_KEY:Ljava/lang/String;

    .line 31
    const-string v0, "gear_bg_primary_color"

    iput-object v0, p0, Lcom/android/wubydax/CustomBg;->COLOR_PRIMARY_KEY:Ljava/lang/String;

    .line 32
    const-string v0, "gear_second_gradient_color"

    iput-object v0, p0, Lcom/android/wubydax/CustomBg;->COLOR_SECONDARY_KEY:Ljava/lang/String;

    .line 33
    const-string v0, "gear_bg_gradient_orientation"

    iput-object v0, p0, Lcom/android/wubydax/CustomBg;->GRADIENT_ORIENTATION_KEY:Ljava/lang/String;

    .line 34
    const-string v0, "enable_gear_custom_bg"

    iput-object v0, p0, Lcom/android/wubydax/CustomBg;->MASTER_SWITCH_KEY:Ljava/lang/String;

    .line 35
    const-string v0, "gear_custom_bg_type"

    iput-object v0, p0, Lcom/android/wubydax/CustomBg;->CUSTOM_BG_TYPE:Ljava/lang/String;

    .line 50
    iput-object p1, p0, Lcom/android/wubydax/CustomBg;->mContext:Landroid/content/Context;

    .line 51
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iput-object v0, p0, Lcom/android/wubydax/CustomBg;->mContentResolver:Landroid/content/ContentResolver;

    .line 52
    return-void
.end method

.method private getGradientOrientation()Landroid/graphics/drawable/GradientDrawable$Orientation;
    .registers 5

    .prologue
    .line 134
    iget-object v1, p0, Lcom/android/wubydax/CustomBg;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v2, p0, Lcom/android/wubydax/CustomBg;->GRADIENT_ORIENTATION_KEY:Ljava/lang/String;

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    .line 135
    .local v0, "orientation":I
    packed-switch v0, :pswitch_data_1c

    .line 145
    sget-object v1, Landroid/graphics/drawable/GradientDrawable$Orientation;->TOP_BOTTOM:Landroid/graphics/drawable/GradientDrawable$Orientation;

    :goto_e
    return-object v1

    .line 137
    :pswitch_f
    sget-object v1, Landroid/graphics/drawable/GradientDrawable$Orientation;->TOP_BOTTOM:Landroid/graphics/drawable/GradientDrawable$Orientation;

    goto :goto_e

    .line 139
    :pswitch_12
    sget-object v1, Landroid/graphics/drawable/GradientDrawable$Orientation;->BOTTOM_TOP:Landroid/graphics/drawable/GradientDrawable$Orientation;

    goto :goto_e

    .line 141
    :pswitch_15
    sget-object v1, Landroid/graphics/drawable/GradientDrawable$Orientation;->LEFT_RIGHT:Landroid/graphics/drawable/GradientDrawable$Orientation;

    goto :goto_e

    .line 143
    :pswitch_18
    sget-object v1, Landroid/graphics/drawable/GradientDrawable$Orientation;->RIGHT_LEFT:Landroid/graphics/drawable/GradientDrawable$Orientation;

    goto :goto_e

    .line 135
    nop

    :pswitch_data_1c
    .packed-switch 0x0
        :pswitch_f
        :pswitch_12
        :pswitch_15
        :pswitch_18
    .end packed-switch
.end method

.method private getMyDrawable()Landroid/graphics/drawable/Drawable;
    .registers 10

    .prologue
    const/4 v8, 0x0

    .line 81
    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v1, v8}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 82
    .local v1, "drawable":Landroid/graphics/drawable/Drawable;
    iget-boolean v5, p0, Lcom/android/wubydax/CustomBg;->mIsEnabled:Z

    if-eqz v5, :cond_f

    .line 83
    iget v5, p0, Lcom/android/wubydax/CustomBg;->mCustomBgType:I

    packed-switch v5, :pswitch_data_7e

    .line 113
    :cond_f
    :goto_f
    return-object v1

    .line 85
    :pswitch_10
    const-string v5, "daxgirl"

    const-string v6, "getMyDrawable image is selected"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 86
    iget-object v5, p0, Lcom/android/wubydax/CustomBg;->mImageUri:Landroid/net/Uri;

    if-eqz v5, :cond_53

    iget-object v5, p0, Lcom/android/wubydax/CustomBg;->mImageUri:Landroid/net/Uri;

    iget-object v6, p0, Lcom/android/wubydax/CustomBg;->mOldUri:Landroid/net/Uri;

    invoke-virtual {v5, v6}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_53

    .line 88
    :try_start_25
    const-string v5, "daxgirl"

    const-string v6, "getMyDrawable getting image"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 89
    iget-object v5, p0, Lcom/android/wubydax/CustomBg;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v6, p0, Lcom/android/wubydax/CustomBg;->mImageUri:Landroid/net/Uri;

    invoke-virtual {v5, v6}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v4

    .line 90
    .local v4, "inputStream":Ljava/io/InputStream;
    invoke-static {v4}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 91
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    new-instance v2, Landroid/graphics/drawable/BitmapDrawable;

    iget-object v5, p0, Lcom/android/wubydax/CustomBg;->mContext:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-direct {v2, v5, v0}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V
    :try_end_43
    .catch Ljava/io/FileNotFoundException; {:try_start_25 .. :try_end_43} :catch_47

    .line 92
    .end local v1    # "drawable":Landroid/graphics/drawable/Drawable;
    .local v2, "drawable":Landroid/graphics/drawable/Drawable;
    :try_start_43
    iput-object v2, p0, Lcom/android/wubydax/CustomBg;->mDrawable:Landroid/graphics/drawable/Drawable;
    :try_end_45
    .catch Ljava/io/FileNotFoundException; {:try_start_43 .. :try_end_45} :catch_7b

    move-object v1, v2

    .line 96
    .end local v2    # "drawable":Landroid/graphics/drawable/Drawable;
    .restart local v1    # "drawable":Landroid/graphics/drawable/Drawable;
    goto :goto_f

    .line 93
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v4    # "inputStream":Ljava/io/InputStream;
    :catch_47
    move-exception v3

    .line 94
    .local v3, "e":Ljava/io/FileNotFoundException;
    :goto_48
    const-string v5, "daxgirl"

    const-string v6, "getMyDrawable exception: file not found"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 95
    invoke-virtual {v3}, Ljava/io/FileNotFoundException;->printStackTrace()V

    goto :goto_f

    .line 98
    .end local v3    # "e":Ljava/io/FileNotFoundException;
    :cond_53
    iget-object v1, p0, Lcom/android/wubydax/CustomBg;->mDrawable:Landroid/graphics/drawable/Drawable;

    .line 100
    goto :goto_f

    .line 102
    :pswitch_56
    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    .end local v1    # "drawable":Landroid/graphics/drawable/Drawable;
    iget v5, p0, Lcom/android/wubydax/CustomBg;->mColorPrimary:I

    invoke-direct {v1, v5}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 103
    .restart local v1    # "drawable":Landroid/graphics/drawable/Drawable;
    goto :goto_f

    .line 105
    :pswitch_5e
    new-instance v1, Landroid/graphics/drawable/GradientDrawable;

    .line 106
    .end local v1    # "drawable":Landroid/graphics/drawable/Drawable;
    invoke-direct {p0}, Lcom/android/wubydax/CustomBg;->getGradientOrientation()Landroid/graphics/drawable/GradientDrawable$Orientation;

    move-result-object v5

    const/4 v6, 0x2

    new-array v6, v6, [I

    iget v7, p0, Lcom/android/wubydax/CustomBg;->mColorPrimary:I

    aput v7, v6, v8

    const/4 v7, 0x1

    iget v8, p0, Lcom/android/wubydax/CustomBg;->mColorSecondary:I

    aput v8, v6, v7

    invoke-direct {v1, v5, v6}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    .restart local v1    # "drawable":Landroid/graphics/drawable/Drawable;
    move-object v5, v1

    .line 108
    check-cast v5, Landroid/graphics/drawable/GradientDrawable;

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    goto :goto_f

    .line 93
    .end local v1    # "drawable":Landroid/graphics/drawable/Drawable;
    .restart local v0    # "bitmap":Landroid/graphics/Bitmap;
    .restart local v2    # "drawable":Landroid/graphics/drawable/Drawable;
    .restart local v4    # "inputStream":Ljava/io/InputStream;
    :catch_7b
    move-exception v3

    move-object v1, v2

    .end local v2    # "drawable":Landroid/graphics/drawable/Drawable;
    .restart local v1    # "drawable":Landroid/graphics/drawable/Drawable;
    goto :goto_48

    .line 83
    :pswitch_data_7e
    .packed-switch 0x0
        :pswitch_10
        :pswitch_56
        :pswitch_5e
    .end packed-switch
.end method

.method private getMyScaleType()Landroid/widget/ImageView$ScaleType;
    .registers 5

    .prologue
    .line 67
    iget-object v1, p0, Lcom/android/wubydax/CustomBg;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v2, p0, Lcom/android/wubydax/CustomBg;->CROP_KEY:Ljava/lang/String;

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    .line 68
    .local v0, "scaleType":I
    packed-switch v0, :pswitch_data_18

    .line 76
    sget-object v1, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    :goto_e
    return-object v1

    .line 70
    :pswitch_f
    sget-object v1, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    goto :goto_e

    .line 72
    :pswitch_12
    sget-object v1, Landroid/widget/ImageView$ScaleType;->CENTER_INSIDE:Landroid/widget/ImageView$ScaleType;

    goto :goto_e

    .line 74
    :pswitch_15
    sget-object v1, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    goto :goto_e

    .line 68
    :pswitch_data_18
    .packed-switch 0x0
        :pswitch_f
        :pswitch_12
        :pswitch_15
    .end packed-switch
.end method

.method private initValues()V
    .registers 6

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 55
    iget-object v1, p0, Lcom/android/wubydax/CustomBg;->mImageUri:Landroid/net/Uri;

    iput-object v1, p0, Lcom/android/wubydax/CustomBg;->mOldUri:Landroid/net/Uri;

    .line 56
    iget-object v1, p0, Lcom/android/wubydax/CustomBg;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v4, p0, Lcom/android/wubydax/CustomBg;->URI_KEY:Ljava/lang/String;

    invoke-static {v1, v4}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 57
    .local v0, "uriString":Ljava/lang/String;
    if-eqz v0, :cond_60

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_60

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    :goto_1c
    iput-object v1, p0, Lcom/android/wubydax/CustomBg;->mImageUri:Landroid/net/Uri;

    .line 58
    iget-object v1, p0, Lcom/android/wubydax/CustomBg;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v4, p0, Lcom/android/wubydax/CustomBg;->MASTER_SWITCH_KEY:Ljava/lang/String;

    invoke-static {v1, v4, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    if-eqz v1, :cond_62

    move v1, v2

    :goto_29
    iput-boolean v1, p0, Lcom/android/wubydax/CustomBg;->mIsEnabled:Z

    .line 59
    iget-object v1, p0, Lcom/android/wubydax/CustomBg;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v2, p0, Lcom/android/wubydax/CustomBg;->OPACITY_KEY:Ljava/lang/String;

    const/16 v4, 0xff

    invoke-static {v1, v2, v4}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lcom/android/wubydax/CustomBg;->mOpacity:I

    .line 60
    iget-object v1, p0, Lcom/android/wubydax/CustomBg;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v2, p0, Lcom/android/wubydax/CustomBg;->COLOR_PRIMARY_KEY:Ljava/lang/String;

    const/4 v4, -0x1

    invoke-static {v1, v2, v4}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lcom/android/wubydax/CustomBg;->mColorPrimary:I

    .line 61
    iget-object v1, p0, Lcom/android/wubydax/CustomBg;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v2, p0, Lcom/android/wubydax/CustomBg;->COLOR_SECONDARY_KEY:Ljava/lang/String;

    const v4, -0xff0001

    invoke-static {v1, v2, v4}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lcom/android/wubydax/CustomBg;->mColorSecondary:I

    .line 62
    invoke-direct {p0}, Lcom/android/wubydax/CustomBg;->getMyScaleType()Landroid/widget/ImageView$ScaleType;

    move-result-object v1

    iput-object v1, p0, Lcom/android/wubydax/CustomBg;->mScaleType:Landroid/widget/ImageView$ScaleType;

    .line 63
    iget-object v1, p0, Lcom/android/wubydax/CustomBg;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v2, p0, Lcom/android/wubydax/CustomBg;->CUSTOM_BG_TYPE:Ljava/lang/String;

    invoke-static {v1, v2, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lcom/android/wubydax/CustomBg;->mCustomBgType:I

    .line 64
    return-void

    .line 57
    :cond_60
    const/4 v1, 0x0

    goto :goto_1c

    :cond_62
    move v1, v3

    .line 58
    goto :goto_29
.end method

.method private initView()V
    .registers 3

    .prologue
    .line 126
    invoke-direct {p0}, Lcom/android/wubydax/CustomBg;->getMyDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 127
    .local v0, "drawable":Landroid/graphics/drawable/Drawable;
    iget v1, p0, Lcom/android/wubydax/CustomBg;->mOpacity:I

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 128
    invoke-virtual {p0, v0}, Lcom/android/wubydax/CustomBg;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 129
    iget-object v1, p0, Lcom/android/wubydax/CustomBg;->mScaleType:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {p0, v1}, Lcom/android/wubydax/CustomBg;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 130
    return-void
.end method


# virtual methods
.method public onWindowFocusChanged(Z)V
    .registers 3
    .param p1, "hasWindowFocus"    # Z

    .prologue
    .line 118
    invoke-super {p0, p1}, Landroid/widget/ImageView;->onWindowFocusChanged(Z)V

    .line 119
    if-eqz p1, :cond_11

    invoke-virtual {p0}, Lcom/android/wubydax/CustomBg;->getVisibility()I

    move-result v0

    if-nez v0, :cond_11

    .line 120
    invoke-direct {p0}, Lcom/android/wubydax/CustomBg;->initValues()V

    .line 121
    invoke-direct {p0}, Lcom/android/wubydax/CustomBg;->initView()V

    .line 123
    :cond_11
    return-void
.end method
