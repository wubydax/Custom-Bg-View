.class public Lcom/android/wubydax/CustomBg;
.super Landroid/widget/ImageView;
.source "CustomBg.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/wubydax/CustomBg$CustomViewObserver;
    }
.end annotation


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

.field private mCustomViewObserver:Lcom/android/wubydax/CustomBg$CustomViewObserver;

.field private mHandler:Landroid/os/Handler;

.field private mImageUri:Landroid/net/Uri;

.field private mIsEnabled:Z

.field private mOpacity:I

.field private mScaleType:Landroid/widget/ImageView$ScaleType;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 50
    invoke-direct {p0, p1, p2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 29
    const-string v0, "incallui_bg"

    iput-object v0, p0, Lcom/android/wubydax/CustomBg;->URI_KEY:Ljava/lang/String;

    .line 30
    const-string v0, "gear_bg_opacity"

    iput-object v0, p0, Lcom/android/wubydax/CustomBg;->OPACITY_KEY:Ljava/lang/String;

    .line 31
    const-string v0, "gear_bg_crop_type"

    iput-object v0, p0, Lcom/android/wubydax/CustomBg;->CROP_KEY:Ljava/lang/String;

    .line 32
    const-string v0, "gear_bg_primary_color"

    iput-object v0, p0, Lcom/android/wubydax/CustomBg;->COLOR_PRIMARY_KEY:Ljava/lang/String;

    .line 33
    const-string v0, "gear_second_gradient_color"

    iput-object v0, p0, Lcom/android/wubydax/CustomBg;->COLOR_SECONDARY_KEY:Ljava/lang/String;

    .line 34
    const-string v0, "gear_bg_gradient_orientation"

    iput-object v0, p0, Lcom/android/wubydax/CustomBg;->GRADIENT_ORIENTATION_KEY:Ljava/lang/String;

    .line 35
    const-string v0, "enable_gear_custom_bg"

    iput-object v0, p0, Lcom/android/wubydax/CustomBg;->MASTER_SWITCH_KEY:Ljava/lang/String;

    .line 36
    const-string v0, "gear_custom_bg_type"

    iput-object v0, p0, Lcom/android/wubydax/CustomBg;->CUSTOM_BG_TYPE:Ljava/lang/String;

    .line 51
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/android/wubydax/CustomBg;->mHandler:Landroid/os/Handler;

    .line 52
    new-instance v0, Lcom/android/wubydax/CustomBg$CustomViewObserver;

    iget-object v1, p0, Lcom/android/wubydax/CustomBg;->mHandler:Landroid/os/Handler;

    invoke-direct {v0, p0, v1}, Lcom/android/wubydax/CustomBg$CustomViewObserver;-><init>(Lcom/android/wubydax/CustomBg;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/android/wubydax/CustomBg;->mCustomViewObserver:Lcom/android/wubydax/CustomBg$CustomViewObserver;

    .line 53
    iput-object p1, p0, Lcom/android/wubydax/CustomBg;->mContext:Landroid/content/Context;

    .line 54
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iput-object v0, p0, Lcom/android/wubydax/CustomBg;->mContentResolver:Landroid/content/ContentResolver;

    .line 55
    invoke-direct {p0}, Lcom/android/wubydax/CustomBg;->initValues()V

    .line 56
    return-void
.end method

.method static synthetic access$000(Lcom/android/wubydax/CustomBg;)V
    .registers 1
    .param p0, "x0"    # Lcom/android/wubydax/CustomBg;

    .prologue
    .line 27
    invoke-direct {p0}, Lcom/android/wubydax/CustomBg;->initValues()V

    return-void
.end method

.method static synthetic access$100(Lcom/android/wubydax/CustomBg;)V
    .registers 1
    .param p0, "x0"    # Lcom/android/wubydax/CustomBg;

    .prologue
    .line 27
    invoke-direct {p0}, Lcom/android/wubydax/CustomBg;->initView()V

    return-void
.end method

.method private getMyDrawable()Landroid/graphics/drawable/Drawable;
    .registers 10

    .prologue
    const/4 v8, 0x0

    .line 84
    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v1, v8}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 85
    .local v1, "drawable":Landroid/graphics/drawable/Drawable;
    iget-boolean v5, p0, Lcom/android/wubydax/CustomBg;->mIsEnabled:Z

    if-eqz v5, :cond_f

    .line 86
    iget v5, p0, Lcom/android/wubydax/CustomBg;->mCustomBgType:I

    packed-switch v5, :pswitch_data_58

    .line 110
    :cond_f
    :goto_f
    return-object v1

    .line 88
    :pswitch_10
    iget-object v5, p0, Lcom/android/wubydax/CustomBg;->mImageUri:Landroid/net/Uri;

    if-eqz v5, :cond_f

    .line 90
    :try_start_14
    iget-object v5, p0, Lcom/android/wubydax/CustomBg;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v6, p0, Lcom/android/wubydax/CustomBg;->mImageUri:Landroid/net/Uri;

    invoke-virtual {v5, v6}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v4

    .line 91
    .local v4, "inputStream":Ljava/io/InputStream;
    invoke-static {v4}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 92
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    new-instance v2, Landroid/graphics/drawable/BitmapDrawable;

    iget-object v5, p0, Lcom/android/wubydax/CustomBg;->mContext:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-direct {v2, v5, v0}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V
    :try_end_2b
    .catch Ljava/io/FileNotFoundException; {:try_start_14 .. :try_end_2b} :catch_2d

    .end local v1    # "drawable":Landroid/graphics/drawable/Drawable;
    .local v2, "drawable":Landroid/graphics/drawable/Drawable;
    move-object v1, v2

    .line 95
    .end local v2    # "drawable":Landroid/graphics/drawable/Drawable;
    .restart local v1    # "drawable":Landroid/graphics/drawable/Drawable;
    goto :goto_f

    .line 93
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v4    # "inputStream":Ljava/io/InputStream;
    :catch_2d
    move-exception v3

    .line 94
    .local v3, "e":Ljava/io/FileNotFoundException;
    invoke-virtual {v3}, Ljava/io/FileNotFoundException;->printStackTrace()V

    goto :goto_f

    .line 99
    .end local v3    # "e":Ljava/io/FileNotFoundException;
    :pswitch_32
    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    .end local v1    # "drawable":Landroid/graphics/drawable/Drawable;
    iget v5, p0, Lcom/android/wubydax/CustomBg;->mColorPrimary:I

    invoke-direct {v1, v5}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 100
    .restart local v1    # "drawable":Landroid/graphics/drawable/Drawable;
    goto :goto_f

    .line 102
    :pswitch_3a
    new-instance v1, Landroid/graphics/drawable/GradientDrawable;

    .line 103
    .end local v1    # "drawable":Landroid/graphics/drawable/Drawable;
    invoke-virtual {p0}, Lcom/android/wubydax/CustomBg;->getGradientOrientation()Landroid/graphics/drawable/GradientDrawable$Orientation;

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

    .line 105
    check-cast v5, Landroid/graphics/drawable/GradientDrawable;

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    goto :goto_f

    .line 86
    nop

    :pswitch_data_58
    .packed-switch 0x0
        :pswitch_10
        :pswitch_32
        :pswitch_3a
    .end packed-switch
.end method

.method private getMyScaleType()Landroid/widget/ImageView$ScaleType;
    .registers 5

    .prologue
    .line 70
    iget-object v1, p0, Lcom/android/wubydax/CustomBg;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v2, p0, Lcom/android/wubydax/CustomBg;->CROP_KEY:Ljava/lang/String;

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    .line 71
    .local v0, "scaleType":I
    packed-switch v0, :pswitch_data_18

    .line 79
    sget-object v1, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    :goto_e
    return-object v1

    .line 73
    :pswitch_f
    sget-object v1, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    goto :goto_e

    .line 75
    :pswitch_12
    sget-object v1, Landroid/widget/ImageView$ScaleType;->CENTER_INSIDE:Landroid/widget/ImageView$ScaleType;

    goto :goto_e

    .line 77
    :pswitch_15
    sget-object v1, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    goto :goto_e

    .line 71
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

    .line 59
    iget-object v1, p0, Lcom/android/wubydax/CustomBg;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v4, p0, Lcom/android/wubydax/CustomBg;->URI_KEY:Ljava/lang/String;

    invoke-static {v1, v4}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 60
    .local v0, "uriString":Ljava/lang/String;
    if-eqz v0, :cond_5c

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5c

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    :goto_18
    iput-object v1, p0, Lcom/android/wubydax/CustomBg;->mImageUri:Landroid/net/Uri;

    .line 61
    iget-object v1, p0, Lcom/android/wubydax/CustomBg;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v4, p0, Lcom/android/wubydax/CustomBg;->MASTER_SWITCH_KEY:Ljava/lang/String;

    invoke-static {v1, v4, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    if-eqz v1, :cond_5e

    move v1, v2

    :goto_25
    iput-boolean v1, p0, Lcom/android/wubydax/CustomBg;->mIsEnabled:Z

    .line 62
    iget-object v1, p0, Lcom/android/wubydax/CustomBg;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v2, p0, Lcom/android/wubydax/CustomBg;->OPACITY_KEY:Ljava/lang/String;

    const/16 v4, 0xff

    invoke-static {v1, v2, v4}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lcom/android/wubydax/CustomBg;->mOpacity:I

    .line 63
    iget-object v1, p0, Lcom/android/wubydax/CustomBg;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v2, p0, Lcom/android/wubydax/CustomBg;->COLOR_PRIMARY_KEY:Ljava/lang/String;

    const/4 v4, -0x1

    invoke-static {v1, v2, v4}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lcom/android/wubydax/CustomBg;->mColorPrimary:I

    .line 64
    iget-object v1, p0, Lcom/android/wubydax/CustomBg;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v2, p0, Lcom/android/wubydax/CustomBg;->COLOR_SECONDARY_KEY:Ljava/lang/String;

    const v4, -0xff0001

    invoke-static {v1, v2, v4}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lcom/android/wubydax/CustomBg;->mColorSecondary:I

    .line 65
    invoke-direct {p0}, Lcom/android/wubydax/CustomBg;->getMyScaleType()Landroid/widget/ImageView$ScaleType;

    move-result-object v1

    iput-object v1, p0, Lcom/android/wubydax/CustomBg;->mScaleType:Landroid/widget/ImageView$ScaleType;

    .line 66
    iget-object v1, p0, Lcom/android/wubydax/CustomBg;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v2, p0, Lcom/android/wubydax/CustomBg;->CUSTOM_BG_TYPE:Ljava/lang/String;

    invoke-static {v1, v2, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lcom/android/wubydax/CustomBg;->mCustomBgType:I

    .line 67
    return-void

    .line 60
    :cond_5c
    const/4 v1, 0x0

    goto :goto_18

    :cond_5e
    move v1, v3

    .line 61
    goto :goto_25
.end method

.method private initView()V
    .registers 3

    .prologue
    .line 120
    invoke-direct {p0}, Lcom/android/wubydax/CustomBg;->getMyDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 121
    .local v0, "drawable":Landroid/graphics/drawable/Drawable;
    iget v1, p0, Lcom/android/wubydax/CustomBg;->mOpacity:I

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 122
    invoke-virtual {p0, v0}, Lcom/android/wubydax/CustomBg;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 123
    iget-object v1, p0, Lcom/android/wubydax/CustomBg;->mScaleType:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {p0, v1}, Lcom/android/wubydax/CustomBg;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 124
    return-void
.end method


# virtual methods
.method public getGradientOrientation()Landroid/graphics/drawable/GradientDrawable$Orientation;
    .registers 5

    .prologue
    .line 148
    iget-object v1, p0, Lcom/android/wubydax/CustomBg;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v2, p0, Lcom/android/wubydax/CustomBg;->GRADIENT_ORIENTATION_KEY:Ljava/lang/String;

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    .line 149
    .local v0, "orientation":I
    packed-switch v0, :pswitch_data_1c

    .line 159
    sget-object v1, Landroid/graphics/drawable/GradientDrawable$Orientation;->TOP_BOTTOM:Landroid/graphics/drawable/GradientDrawable$Orientation;

    :goto_e
    return-object v1

    .line 151
    :pswitch_f
    sget-object v1, Landroid/graphics/drawable/GradientDrawable$Orientation;->TOP_BOTTOM:Landroid/graphics/drawable/GradientDrawable$Orientation;

    goto :goto_e

    .line 153
    :pswitch_12
    sget-object v1, Landroid/graphics/drawable/GradientDrawable$Orientation;->BOTTOM_TOP:Landroid/graphics/drawable/GradientDrawable$Orientation;

    goto :goto_e

    .line 155
    :pswitch_15
    sget-object v1, Landroid/graphics/drawable/GradientDrawable$Orientation;->LEFT_RIGHT:Landroid/graphics/drawable/GradientDrawable$Orientation;

    goto :goto_e

    .line 157
    :pswitch_18
    sget-object v1, Landroid/graphics/drawable/GradientDrawable$Orientation;->RIGHT_LEFT:Landroid/graphics/drawable/GradientDrawable$Orientation;

    goto :goto_e

    .line 149
    nop

    :pswitch_data_1c
    .packed-switch 0x0
        :pswitch_f
        :pswitch_12
        :pswitch_15
        :pswitch_18
    .end packed-switch
.end method

.method protected onAttachedToWindow()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 128
    invoke-super {p0}, Landroid/widget/ImageView;->onAttachedToWindow()V

    .line 129
    iget-object v0, p0, Lcom/android/wubydax/CustomBg;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v1, p0, Lcom/android/wubydax/CustomBg;->MASTER_SWITCH_KEY:Ljava/lang/String;

    invoke-static {v1}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    iget-object v2, p0, Lcom/android/wubydax/CustomBg;->mCustomViewObserver:Lcom/android/wubydax/CustomBg$CustomViewObserver;

    invoke-virtual {v0, v1, v3, v2}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 130
    iget-object v0, p0, Lcom/android/wubydax/CustomBg;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v1, p0, Lcom/android/wubydax/CustomBg;->CROP_KEY:Ljava/lang/String;

    invoke-static {v1}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    iget-object v2, p0, Lcom/android/wubydax/CustomBg;->mCustomViewObserver:Lcom/android/wubydax/CustomBg$CustomViewObserver;

    invoke-virtual {v0, v1, v3, v2}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 131
    iget-object v0, p0, Lcom/android/wubydax/CustomBg;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v1, p0, Lcom/android/wubydax/CustomBg;->OPACITY_KEY:Ljava/lang/String;

    invoke-static {v1}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    iget-object v2, p0, Lcom/android/wubydax/CustomBg;->mCustomViewObserver:Lcom/android/wubydax/CustomBg$CustomViewObserver;

    invoke-virtual {v0, v1, v3, v2}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 132
    iget-object v0, p0, Lcom/android/wubydax/CustomBg;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v1, p0, Lcom/android/wubydax/CustomBg;->COLOR_PRIMARY_KEY:Ljava/lang/String;

    invoke-static {v1}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    iget-object v2, p0, Lcom/android/wubydax/CustomBg;->mCustomViewObserver:Lcom/android/wubydax/CustomBg$CustomViewObserver;

    invoke-virtual {v0, v1, v3, v2}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 133
    iget-object v0, p0, Lcom/android/wubydax/CustomBg;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v1, p0, Lcom/android/wubydax/CustomBg;->GRADIENT_ORIENTATION_KEY:Ljava/lang/String;

    invoke-static {v1}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    iget-object v2, p0, Lcom/android/wubydax/CustomBg;->mCustomViewObserver:Lcom/android/wubydax/CustomBg$CustomViewObserver;

    invoke-virtual {v0, v1, v3, v2}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 134
    iget-object v0, p0, Lcom/android/wubydax/CustomBg;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v1, p0, Lcom/android/wubydax/CustomBg;->COLOR_SECONDARY_KEY:Ljava/lang/String;

    invoke-static {v1}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    iget-object v2, p0, Lcom/android/wubydax/CustomBg;->mCustomViewObserver:Lcom/android/wubydax/CustomBg$CustomViewObserver;

    invoke-virtual {v0, v1, v3, v2}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 135
    iget-object v0, p0, Lcom/android/wubydax/CustomBg;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v1, p0, Lcom/android/wubydax/CustomBg;->URI_KEY:Ljava/lang/String;

    invoke-static {v1}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    iget-object v2, p0, Lcom/android/wubydax/CustomBg;->mCustomViewObserver:Lcom/android/wubydax/CustomBg$CustomViewObserver;

    invoke-virtual {v0, v1, v3, v2}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 136
    iget-object v0, p0, Lcom/android/wubydax/CustomBg;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v1, p0, Lcom/android/wubydax/CustomBg;->CUSTOM_BG_TYPE:Ljava/lang/String;

    invoke-static {v1}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    iget-object v2, p0, Lcom/android/wubydax/CustomBg;->mCustomViewObserver:Lcom/android/wubydax/CustomBg$CustomViewObserver;

    invoke-virtual {v0, v1, v3, v2}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 139
    return-void
.end method

.method protected onDetachedFromWindow()V
    .registers 3

    .prologue
    .line 143
    invoke-super {p0}, Landroid/widget/ImageView;->onDetachedFromWindow()V

    .line 144
    iget-object v0, p0, Lcom/android/wubydax/CustomBg;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v1, p0, Lcom/android/wubydax/CustomBg;->mCustomViewObserver:Lcom/android/wubydax/CustomBg$CustomViewObserver;

    invoke-virtual {v0, v1}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 145
    return-void
.end method

.method protected onFinishInflate()V
    .registers 1

    .prologue
    .line 115
    invoke-super {p0}, Landroid/widget/ImageView;->onFinishInflate()V

    .line 116
    invoke-direct {p0}, Lcom/android/wubydax/CustomBg;->initView()V

    .line 117
    return-void
.end method
