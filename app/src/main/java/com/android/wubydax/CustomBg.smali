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
.field COLOR_PRIMARY_KEY:Ljava/lang/String;

.field COLOR_SECONDARY_KEY:Ljava/lang/String;

.field CROP_KEY:Ljava/lang/String;

.field GRADIENT_ORIENTATION_KEY:Ljava/lang/String;

.field GRADIENT_SWITCH_KEY:Ljava/lang/String;

.field IMAGE_SWITCH_KEY:Ljava/lang/String;

.field MASTER_SWITCH_KEY:Ljava/lang/String;

.field OPACITY_KEY:Ljava/lang/String;

.field URI_KEY:Ljava/lang/String;

.field private mColorPrimary:I

.field private mColorSecondary:I

.field private mContentResolver:Landroid/content/ContentResolver;

.field private mContext:Landroid/content/Context;

.field private mCustomViewObserver:Lcom/android/wubydax/CustomBg$CustomViewObserver;

.field private mGradientOrientation:Landroid/graphics/drawable/GradientDrawable$Orientation;

.field private mHandler:Landroid/os/Handler;

.field private mImageUri:Landroid/net/Uri;

.field private mIsColor:Z

.field private mIsEnabled:Z

.field private mIsGradient:Z

.field private mOpacity:I

.field private mScaleType:Landroid/widget/ImageView$ScaleType;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 53
    invoke-direct {p0, p1, p2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 29
    const-string v0, "some_database_key"

    iput-object v0, p0, Lcom/android/wubydax/CustomBg;->URI_KEY:Ljava/lang/String;

    .line 30
    const-string v0, "view_opacity_key"

    iput-object v0, p0, Lcom/android/wubydax/CustomBg;->OPACITY_KEY:Ljava/lang/String;

    .line 31
    const-string v0, "crop_key"

    iput-object v0, p0, Lcom/android/wubydax/CustomBg;->CROP_KEY:Ljava/lang/String;

    .line 32
    const-string v0, "is_color_enabled"

    iput-object v0, p0, Lcom/android/wubydax/CustomBg;->IMAGE_SWITCH_KEY:Ljava/lang/String;

    .line 33
    const-string v0, "is_gradient_enabled"

    iput-object v0, p0, Lcom/android/wubydax/CustomBg;->GRADIENT_SWITCH_KEY:Ljava/lang/String;

    .line 34
    const-string v0, "color_primary_database_key"

    iput-object v0, p0, Lcom/android/wubydax/CustomBg;->COLOR_PRIMARY_KEY:Ljava/lang/String;

    .line 35
    const-string v0, "color_secondary_database_key"

    iput-object v0, p0, Lcom/android/wubydax/CustomBg;->COLOR_SECONDARY_KEY:Ljava/lang/String;

    .line 36
    const-string v0, "gradient_orientation_key"

    iput-object v0, p0, Lcom/android/wubydax/CustomBg;->GRADIENT_ORIENTATION_KEY:Ljava/lang/String;

    .line 37
    const-string v0, "is_view_enabled"

    iput-object v0, p0, Lcom/android/wubydax/CustomBg;->MASTER_SWITCH_KEY:Ljava/lang/String;

    .line 54
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/android/wubydax/CustomBg;->mHandler:Landroid/os/Handler;

    .line 55
    new-instance v0, Lcom/android/wubydax/CustomBg$CustomViewObserver;

    iget-object v1, p0, Lcom/android/wubydax/CustomBg;->mHandler:Landroid/os/Handler;

    invoke-direct {v0, p0, v1}, Lcom/android/wubydax/CustomBg$CustomViewObserver;-><init>(Lcom/android/wubydax/CustomBg;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/android/wubydax/CustomBg;->mCustomViewObserver:Lcom/android/wubydax/CustomBg$CustomViewObserver;

    .line 56
    iput-object p1, p0, Lcom/android/wubydax/CustomBg;->mContext:Landroid/content/Context;

    .line 57
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iput-object v0, p0, Lcom/android/wubydax/CustomBg;->mContentResolver:Landroid/content/ContentResolver;

    .line 58
    invoke-direct {p0}, Lcom/android/wubydax/CustomBg;->initValues()V

    .line 59
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
    .registers 11

    .prologue
    const/4 v9, 0x0

    .line 89
    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v1, v9}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 90
    .local v1, "drawable":Landroid/graphics/drawable/Drawable;
    iget-object v6, p0, Lcom/android/wubydax/CustomBg;->mImageUri:Landroid/net/Uri;

    if-eqz v6, :cond_30

    iget-boolean v6, p0, Lcom/android/wubydax/CustomBg;->mIsEnabled:Z

    if-eqz v6, :cond_30

    iget-boolean v6, p0, Lcom/android/wubydax/CustomBg;->mIsColor:Z

    if-nez v6, :cond_30

    .line 92
    :try_start_12
    iget-object v6, p0, Lcom/android/wubydax/CustomBg;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v7, p0, Lcom/android/wubydax/CustomBg;->mImageUri:Landroid/net/Uri;

    invoke-virtual {v6, v7}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v5

    .line 93
    .local v5, "inputStream":Ljava/io/InputStream;
    invoke-static {v5}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 94
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    new-instance v2, Landroid/graphics/drawable/BitmapDrawable;

    iget-object v6, p0, Lcom/android/wubydax/CustomBg;->mContext:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-direct {v2, v6, v0}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V
    :try_end_29
    .catch Ljava/io/FileNotFoundException; {:try_start_12 .. :try_end_29} :catch_2b

    .end local v1    # "drawable":Landroid/graphics/drawable/Drawable;
    .local v2, "drawable":Landroid/graphics/drawable/Drawable;
    move-object v1, v2

    .line 110
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v2    # "drawable":Landroid/graphics/drawable/Drawable;
    .end local v5    # "inputStream":Ljava/io/InputStream;
    .restart local v1    # "drawable":Landroid/graphics/drawable/Drawable;
    :cond_2a
    :goto_2a
    return-object v1

    .line 95
    :catch_2b
    move-exception v3

    .line 96
    .local v3, "e":Ljava/io/FileNotFoundException;
    invoke-virtual {v3}, Ljava/io/FileNotFoundException;->printStackTrace()V

    goto :goto_2a

    .line 99
    .end local v3    # "e":Ljava/io/FileNotFoundException;
    :cond_30
    iget-boolean v6, p0, Lcom/android/wubydax/CustomBg;->mIsEnabled:Z

    if-eqz v6, :cond_2a

    iget-boolean v6, p0, Lcom/android/wubydax/CustomBg;->mIsColor:Z

    if-eqz v6, :cond_2a

    .line 100
    iget-boolean v6, p0, Lcom/android/wubydax/CustomBg;->mIsGradient:Z

    if-nez v6, :cond_44

    .line 101
    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    .end local v1    # "drawable":Landroid/graphics/drawable/Drawable;
    iget v6, p0, Lcom/android/wubydax/CustomBg;->mColorPrimary:I

    invoke-direct {v1, v6}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .restart local v1    # "drawable":Landroid/graphics/drawable/Drawable;
    goto :goto_2a

    .line 103
    :cond_44
    new-instance v4, Landroid/graphics/drawable/GradientDrawable;

    .line 104
    invoke-virtual {p0}, Lcom/android/wubydax/CustomBg;->getGradientOrientation()Landroid/graphics/drawable/GradientDrawable$Orientation;

    move-result-object v6

    const/4 v7, 0x2

    new-array v7, v7, [I

    iget v8, p0, Lcom/android/wubydax/CustomBg;->mColorPrimary:I

    aput v8, v7, v9

    const/4 v8, 0x1

    iget v9, p0, Lcom/android/wubydax/CustomBg;->mColorSecondary:I

    aput v9, v7, v8

    invoke-direct {v4, v6, v7}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    .line 106
    .local v4, "gd":Landroid/graphics/drawable/GradientDrawable;
    const/4 v6, 0x0

    invoke-virtual {v4, v6}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 107
    move-object v1, v4

    goto :goto_2a
.end method

.method private getMyScaleType()Landroid/widget/ImageView$ScaleType;
    .registers 5

    .prologue
    .line 75
    iget-object v1, p0, Lcom/android/wubydax/CustomBg;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v2, p0, Lcom/android/wubydax/CustomBg;->CROP_KEY:Ljava/lang/String;

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    .line 76
    .local v0, "scaleType":I
    packed-switch v0, :pswitch_data_18

    .line 84
    sget-object v1, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    :goto_e
    return-object v1

    .line 78
    :pswitch_f
    sget-object v1, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    goto :goto_e

    .line 80
    :pswitch_12
    sget-object v1, Landroid/widget/ImageView$ScaleType;->CENTER_INSIDE:Landroid/widget/ImageView$ScaleType;

    goto :goto_e

    .line 82
    :pswitch_15
    sget-object v1, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    goto :goto_e

    .line 76
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
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 62
    iget-object v1, p0, Lcom/android/wubydax/CustomBg;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v4, p0, Lcom/android/wubydax/CustomBg;->URI_KEY:Ljava/lang/String;

    invoke-static {v1, v4}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 63
    .local v0, "uriString":Ljava/lang/String;
    if-eqz v0, :cond_71

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_71

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    :goto_18
    iput-object v1, p0, Lcom/android/wubydax/CustomBg;->mImageUri:Landroid/net/Uri;

    .line 64
    iget-object v1, p0, Lcom/android/wubydax/CustomBg;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v4, p0, Lcom/android/wubydax/CustomBg;->MASTER_SWITCH_KEY:Ljava/lang/String;

    invoke-static {v1, v4, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    if-eqz v1, :cond_73

    move v1, v2

    :goto_25
    iput-boolean v1, p0, Lcom/android/wubydax/CustomBg;->mIsEnabled:Z

    .line 65
    iget-object v1, p0, Lcom/android/wubydax/CustomBg;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v4, p0, Lcom/android/wubydax/CustomBg;->IMAGE_SWITCH_KEY:Ljava/lang/String;

    invoke-static {v1, v4, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    if-eqz v1, :cond_75

    move v1, v2

    :goto_32
    iput-boolean v1, p0, Lcom/android/wubydax/CustomBg;->mIsColor:Z

    .line 66
    iget-object v1, p0, Lcom/android/wubydax/CustomBg;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v4, p0, Lcom/android/wubydax/CustomBg;->GRADIENT_SWITCH_KEY:Ljava/lang/String;

    invoke-static {v1, v4, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    if-eqz v1, :cond_77

    :goto_3e
    iput-boolean v2, p0, Lcom/android/wubydax/CustomBg;->mIsGradient:Z

    .line 67
    iget-object v1, p0, Lcom/android/wubydax/CustomBg;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v2, p0, Lcom/android/wubydax/CustomBg;->OPACITY_KEY:Ljava/lang/String;

    const/16 v3, 0xff

    invoke-static {v1, v2, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lcom/android/wubydax/CustomBg;->mOpacity:I

    .line 68
    iget-object v1, p0, Lcom/android/wubydax/CustomBg;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v2, p0, Lcom/android/wubydax/CustomBg;->COLOR_PRIMARY_KEY:Ljava/lang/String;

    const/4 v3, -0x1

    invoke-static {v1, v2, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lcom/android/wubydax/CustomBg;->mColorPrimary:I

    .line 69
    iget-object v1, p0, Lcom/android/wubydax/CustomBg;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v2, p0, Lcom/android/wubydax/CustomBg;->COLOR_SECONDARY_KEY:Ljava/lang/String;

    const v3, -0xff0001

    invoke-static {v1, v2, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lcom/android/wubydax/CustomBg;->mColorSecondary:I

    .line 70
    invoke-direct {p0}, Lcom/android/wubydax/CustomBg;->getMyScaleType()Landroid/widget/ImageView$ScaleType;

    move-result-object v1

    iput-object v1, p0, Lcom/android/wubydax/CustomBg;->mScaleType:Landroid/widget/ImageView$ScaleType;

    .line 71
    invoke-virtual {p0}, Lcom/android/wubydax/CustomBg;->getGradientOrientation()Landroid/graphics/drawable/GradientDrawable$Orientation;

    move-result-object v1

    iput-object v1, p0, Lcom/android/wubydax/CustomBg;->mGradientOrientation:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 72
    return-void

    .line 63
    :cond_71
    const/4 v1, 0x0

    goto :goto_18

    :cond_73
    move v1, v3

    .line 64
    goto :goto_25

    :cond_75
    move v1, v3

    .line 65
    goto :goto_32

    :cond_77
    move v2, v3

    .line 66
    goto :goto_3e
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
    .line 146
    iget-object v1, p0, Lcom/android/wubydax/CustomBg;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v2, p0, Lcom/android/wubydax/CustomBg;->GRADIENT_ORIENTATION_KEY:Ljava/lang/String;

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    .line 147
    .local v0, "orientation":I
    packed-switch v0, :pswitch_data_1c

    .line 157
    sget-object v1, Landroid/graphics/drawable/GradientDrawable$Orientation;->TOP_BOTTOM:Landroid/graphics/drawable/GradientDrawable$Orientation;

    :goto_e
    return-object v1

    .line 149
    :pswitch_f
    sget-object v1, Landroid/graphics/drawable/GradientDrawable$Orientation;->TOP_BOTTOM:Landroid/graphics/drawable/GradientDrawable$Orientation;

    goto :goto_e

    .line 151
    :pswitch_12
    sget-object v1, Landroid/graphics/drawable/GradientDrawable$Orientation;->BOTTOM_TOP:Landroid/graphics/drawable/GradientDrawable$Orientation;

    goto :goto_e

    .line 153
    :pswitch_15
    sget-object v1, Landroid/graphics/drawable/GradientDrawable$Orientation;->LEFT_RIGHT:Landroid/graphics/drawable/GradientDrawable$Orientation;

    goto :goto_e

    .line 155
    :pswitch_18
    sget-object v1, Landroid/graphics/drawable/GradientDrawable$Orientation;->RIGHT_LEFT:Landroid/graphics/drawable/GradientDrawable$Orientation;

    goto :goto_e

    .line 147
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

    iget-object v1, p0, Lcom/android/wubydax/CustomBg;->IMAGE_SWITCH_KEY:Ljava/lang/String;

    invoke-static {v1}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    iget-object v2, p0, Lcom/android/wubydax/CustomBg;->mCustomViewObserver:Lcom/android/wubydax/CustomBg$CustomViewObserver;

    invoke-virtual {v0, v1, v3, v2}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 134
    iget-object v0, p0, Lcom/android/wubydax/CustomBg;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v1, p0, Lcom/android/wubydax/CustomBg;->GRADIENT_SWITCH_KEY:Ljava/lang/String;

    invoke-static {v1}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    iget-object v2, p0, Lcom/android/wubydax/CustomBg;->mCustomViewObserver:Lcom/android/wubydax/CustomBg$CustomViewObserver;

    invoke-virtual {v0, v1, v3, v2}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 135
    iget-object v0, p0, Lcom/android/wubydax/CustomBg;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v1, p0, Lcom/android/wubydax/CustomBg;->GRADIENT_ORIENTATION_KEY:Ljava/lang/String;

    invoke-static {v1}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    iget-object v2, p0, Lcom/android/wubydax/CustomBg;->mCustomViewObserver:Lcom/android/wubydax/CustomBg$CustomViewObserver;

    invoke-virtual {v0, v1, v3, v2}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 136
    iget-object v0, p0, Lcom/android/wubydax/CustomBg;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v1, p0, Lcom/android/wubydax/CustomBg;->COLOR_SECONDARY_KEY:Ljava/lang/String;

    invoke-static {v1}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    iget-object v2, p0, Lcom/android/wubydax/CustomBg;->mCustomViewObserver:Lcom/android/wubydax/CustomBg$CustomViewObserver;

    invoke-virtual {v0, v1, v3, v2}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 137
    return-void
.end method

.method protected onDetachedFromWindow()V
    .registers 3

    .prologue
    .line 141
    invoke-super {p0}, Landroid/widget/ImageView;->onDetachedFromWindow()V

    .line 142
    iget-object v0, p0, Lcom/android/wubydax/CustomBg;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v1, p0, Lcom/android/wubydax/CustomBg;->mCustomViewObserver:Lcom/android/wubydax/CustomBg$CustomViewObserver;

    invoke-virtual {v0, v1}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 143
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
