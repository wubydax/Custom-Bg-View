.class public Lcom/android/wubydax/CustomBg;
.super Landroid/widget/ImageView;
.source "CustomBg.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/wubydax/CustomBg$CustomViewObserver;
    }
.end annotation


# static fields
.field private static final CROP_KEY:Ljava/lang/String; = "crop_key"

.field private static final MASTER_SWITCH_KEY:Ljava/lang/String; = "is_view_enabled"

.field private static final OPACITY_KEY:Ljava/lang/String; = "view_opacity_key"

.field private static final URI_KEY:Ljava/lang/String; = "some_database_key"


# instance fields
.field private mContentResolver:Landroid/content/ContentResolver;

.field private mContext:Landroid/content/Context;

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
    .line 41
    invoke-direct {p0, p1, p2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 42
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/android/wubydax/CustomBg;->mHandler:Landroid/os/Handler;

    .line 43
    new-instance v0, Lcom/android/wubydax/CustomBg$CustomViewObserver;

    iget-object v1, p0, Lcom/android/wubydax/CustomBg;->mHandler:Landroid/os/Handler;

    invoke-direct {v0, p0, v1}, Lcom/android/wubydax/CustomBg$CustomViewObserver;-><init>(Lcom/android/wubydax/CustomBg;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/android/wubydax/CustomBg;->mCustomViewObserver:Lcom/android/wubydax/CustomBg$CustomViewObserver;

    .line 44
    iput-object p1, p0, Lcom/android/wubydax/CustomBg;->mContext:Landroid/content/Context;

    .line 45
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iput-object v0, p0, Lcom/android/wubydax/CustomBg;->mContentResolver:Landroid/content/ContentResolver;

    .line 46
    invoke-direct {p0}, Lcom/android/wubydax/CustomBg;->initValues()V

    .line 47
    return-void
.end method

.method static synthetic access$000(Lcom/android/wubydax/CustomBg;)V
    .registers 1
    .param p0, "x0"    # Lcom/android/wubydax/CustomBg;

    .prologue
    .line 26
    invoke-direct {p0}, Lcom/android/wubydax/CustomBg;->initValues()V

    return-void
.end method

.method static synthetic access$100(Lcom/android/wubydax/CustomBg;)V
    .registers 1
    .param p0, "x0"    # Lcom/android/wubydax/CustomBg;

    .prologue
    .line 26
    invoke-direct {p0}, Lcom/android/wubydax/CustomBg;->initView()V

    return-void
.end method

.method private getMyDrawable()Landroid/graphics/drawable/Drawable;
    .registers 8

    .prologue
    .line 72
    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    const/4 v5, 0x0

    invoke-direct {v1, v5}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 73
    .local v1, "drawable":Landroid/graphics/drawable/Drawable;
    iget-object v5, p0, Lcom/android/wubydax/CustomBg;->mImageUri:Landroid/net/Uri;

    if-eqz v5, :cond_26

    iget-boolean v5, p0, Lcom/android/wubydax/CustomBg;->mIsEnabled:Z

    if-eqz v5, :cond_26

    .line 75
    :try_start_e
    iget-object v5, p0, Lcom/android/wubydax/CustomBg;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v6, p0, Lcom/android/wubydax/CustomBg;->mImageUri:Landroid/net/Uri;

    invoke-virtual {v5, v6}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v4

    .line 76
    .local v4, "inputStream":Ljava/io/InputStream;
    invoke-static {v4}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 77
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    new-instance v2, Landroid/graphics/drawable/BitmapDrawable;

    iget-object v5, p0, Lcom/android/wubydax/CustomBg;->mContext:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-direct {v2, v5, v0}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V
    :try_end_25
    .catch Ljava/io/FileNotFoundException; {:try_start_e .. :try_end_25} :catch_27

    .end local v1    # "drawable":Landroid/graphics/drawable/Drawable;
    .local v2, "drawable":Landroid/graphics/drawable/Drawable;
    move-object v1, v2

    .line 83
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v2    # "drawable":Landroid/graphics/drawable/Drawable;
    .end local v4    # "inputStream":Ljava/io/InputStream;
    .restart local v1    # "drawable":Landroid/graphics/drawable/Drawable;
    :cond_26
    :goto_26
    return-object v1

    .line 78
    :catch_27
    move-exception v3

    .line 79
    .local v3, "e":Ljava/io/FileNotFoundException;
    invoke-virtual {v3}, Ljava/io/FileNotFoundException;->printStackTrace()V

    goto :goto_26
.end method

.method private getMyScaleType()Landroid/widget/ImageView$ScaleType;
    .registers 5

    .prologue
    .line 58
    iget-object v1, p0, Lcom/android/wubydax/CustomBg;->mContentResolver:Landroid/content/ContentResolver;

    const-string v2, "crop_key"

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    .line 59
    .local v0, "scaleType":I
    packed-switch v0, :pswitch_data_18

    .line 67
    sget-object v1, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    :goto_e
    return-object v1

    .line 61
    :pswitch_f
    sget-object v1, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    goto :goto_e

    .line 63
    :pswitch_12
    sget-object v1, Landroid/widget/ImageView$ScaleType;->CENTER_INSIDE:Landroid/widget/ImageView$ScaleType;

    goto :goto_e

    .line 65
    :pswitch_15
    sget-object v1, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    goto :goto_e

    .line 59
    :pswitch_data_18
    .packed-switch 0x0
        :pswitch_f
        :pswitch_12
        :pswitch_15
    .end packed-switch
.end method

.method private initValues()V
    .registers 5

    .prologue
    const/4 v2, 0x1

    .line 50
    iget-object v1, p0, Lcom/android/wubydax/CustomBg;->mContentResolver:Landroid/content/ContentResolver;

    const-string v3, "some_database_key"

    invoke-static {v1, v3}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 51
    .local v0, "uriString":Ljava/lang/String;
    if-eqz v0, :cond_39

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_39

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    :goto_17
    iput-object v1, p0, Lcom/android/wubydax/CustomBg;->mImageUri:Landroid/net/Uri;

    .line 52
    iget-object v1, p0, Lcom/android/wubydax/CustomBg;->mContentResolver:Landroid/content/ContentResolver;

    const-string v3, "is_view_enabled"

    invoke-static {v1, v3, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    if-eqz v1, :cond_3b

    move v1, v2

    :goto_24
    iput-boolean v1, p0, Lcom/android/wubydax/CustomBg;->mIsEnabled:Z

    .line 53
    iget-object v1, p0, Lcom/android/wubydax/CustomBg;->mContentResolver:Landroid/content/ContentResolver;

    const-string v2, "view_opacity_key"

    const/16 v3, 0xff

    invoke-static {v1, v2, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lcom/android/wubydax/CustomBg;->mOpacity:I

    .line 54
    invoke-direct {p0}, Lcom/android/wubydax/CustomBg;->getMyScaleType()Landroid/widget/ImageView$ScaleType;

    move-result-object v1

    iput-object v1, p0, Lcom/android/wubydax/CustomBg;->mScaleType:Landroid/widget/ImageView$ScaleType;

    .line 55
    return-void

    .line 51
    :cond_39
    const/4 v1, 0x0

    goto :goto_17

    .line 52
    :cond_3b
    const/4 v1, 0x0

    goto :goto_24
.end method

.method private initView()V
    .registers 3

    .prologue
    .line 93
    invoke-direct {p0}, Lcom/android/wubydax/CustomBg;->getMyDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 94
    .local v0, "drawable":Landroid/graphics/drawable/Drawable;
    iget v1, p0, Lcom/android/wubydax/CustomBg;->mOpacity:I

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 95
    invoke-virtual {p0, v0}, Lcom/android/wubydax/CustomBg;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 96
    iget-object v1, p0, Lcom/android/wubydax/CustomBg;->mScaleType:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {p0, v1}, Lcom/android/wubydax/CustomBg;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 97
    return-void
.end method


# virtual methods
.method protected onAttachedToWindow()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 101
    invoke-super {p0}, Landroid/widget/ImageView;->onAttachedToWindow()V

    .line 102
    iget-object v0, p0, Lcom/android/wubydax/CustomBg;->mContentResolver:Landroid/content/ContentResolver;

    const-string v1, "is_view_enabled"

    invoke-static {v1}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    iget-object v2, p0, Lcom/android/wubydax/CustomBg;->mCustomViewObserver:Lcom/android/wubydax/CustomBg$CustomViewObserver;

    invoke-virtual {v0, v1, v3, v2}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 103
    iget-object v0, p0, Lcom/android/wubydax/CustomBg;->mContentResolver:Landroid/content/ContentResolver;

    const-string v1, "crop_key"

    invoke-static {v1}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    iget-object v2, p0, Lcom/android/wubydax/CustomBg;->mCustomViewObserver:Lcom/android/wubydax/CustomBg$CustomViewObserver;

    invoke-virtual {v0, v1, v3, v2}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 104
    iget-object v0, p0, Lcom/android/wubydax/CustomBg;->mContentResolver:Landroid/content/ContentResolver;

    const-string v1, "view_opacity_key"

    invoke-static {v1}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    iget-object v2, p0, Lcom/android/wubydax/CustomBg;->mCustomViewObserver:Lcom/android/wubydax/CustomBg$CustomViewObserver;

    invoke-virtual {v0, v1, v3, v2}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 105
    return-void
.end method

.method protected onDetachedFromWindow()V
    .registers 3

    .prologue
    .line 109
    invoke-super {p0}, Landroid/widget/ImageView;->onDetachedFromWindow()V

    .line 110
    iget-object v0, p0, Lcom/android/wubydax/CustomBg;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v1, p0, Lcom/android/wubydax/CustomBg;->mCustomViewObserver:Lcom/android/wubydax/CustomBg$CustomViewObserver;

    invoke-virtual {v0, v1}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 111
    return-void
.end method

.method protected onFinishInflate()V
    .registers 1

    .prologue
    .line 88
    invoke-super {p0}, Landroid/widget/ImageView;->onFinishInflate()V

    .line 89
    invoke-direct {p0}, Lcom/android/wubydax/CustomBg;->initView()V

    .line 90
    return-void
.end method
