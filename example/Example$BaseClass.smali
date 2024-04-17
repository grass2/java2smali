.class public Lexample/Example$BaseClass;
.super Ljava/lang/Object;
.source "Example.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lexample/Example;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "BaseClass"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lexample/Example$BaseClass$Location;
    }
.end annotation


# instance fields
.field private accSensor:Landroid/hardware/Sensor;

.field private flagArrayList_AccSensor:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public iAltitude:D

.field public iBearing:F

.field public iSpeed:F

.field public ignition:I

.field public lastGpsTime:J

.field public lastLat:F

.field public lastLng:F

.field public lastMovementTime:J

.field public lastSentTime:J

.field public needSendLocation:Z

.field private service:Landroid/content/Context;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lexample/Example$BaseClass;->flagArrayList_AccSensor:Ljava/util/ArrayList;

    return-void
.end method

.method private registerSensorListener(Landroid/hardware/Sensor;I)V
    .registers 3

    .prologue
    .line 91
    return-void
.end method


# virtual methods
.method public SetGps(FFDFF)V
    .registers 16

    .prologue
    .line 70
    const/4 v8, 0x0

    move-object v1, p0

    move v2, p1

    move v3, p2

    move-wide v4, p3

    move v6, p5

    move v7, p6

    invoke-virtual/range {v1 .. v8}, Lexample/Example$BaseClass;->SetGps(FFDFFF)V

    .line 71
    return-void
.end method

.method public SetGps(FFDFFF)V
    .registers 9

    .prologue
    .line 66
    invoke-virtual/range {p0 .. p6}, Lexample/Example$BaseClass;->evalGps(FFDFF)Z

    move-result v0

    iput-boolean v0, p0, Lexample/Example$BaseClass;->needSendLocation:Z

    .line 67
    return-void
.end method

.method public evalGps(FFDFF)Z
    .registers 15

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 46
    iget v0, p0, Lexample/Example$BaseClass;->lastLat:F

    sub-float/2addr v0, p1

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    .line 47
    iget v3, p0, Lexample/Example$BaseClass;->lastLng:F

    sub-float/2addr v3, p2

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    .line 48
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iget-wide v6, p0, Lexample/Example$BaseClass;->lastGpsTime:J

    sub-long/2addr v4, v6

    const-wide/16 v6, 0x3e8

    div-long/2addr v4, v6

    long-to-float v4, v4

    .line 49
    float-to-double v4, v0

    const-wide v6, 0x3f04f8b588e368f1L    # 4.0E-5

    cmpl-double v0, v4, v6

    if-gtz v0, :cond_38

    float-to-double v4, v3

    const-wide v6, 0x3f40624dd2f1a9fcL    # 5.0E-4

    cmpl-double v0, v4, v6

    if-gtz v0, :cond_38

    iget v0, p0, Lexample/Example$BaseClass;->iSpeed:F

    float-to-double v4, v0

    const-wide/high16 v6, 0x3fe0000000000000L    # 0.5

    cmpl-double v0, v4, v6

    if-lez v0, :cond_4c

    :cond_38
    move v0, v1

    .line 50
    :goto_39
    if-eqz v0, :cond_4e

    .line 51
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, p0, Lexample/Example$BaseClass;->lastMovementTime:J

    .line 52
    iput v1, p0, Lexample/Example$BaseClass;->ignition:I

    .line 59
    :cond_43
    :goto_43
    if-eqz v0, :cond_4b

    .line 60
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, p0, Lexample/Example$BaseClass;->lastSentTime:J

    .line 62
    :cond_4b
    return v0

    :cond_4c
    move v0, v2

    .line 49
    goto :goto_39

    .line 53
    :cond_4e
    iget v3, p0, Lexample/Example$BaseClass;->ignition:I

    if-ne v3, v1, :cond_63

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iget-wide v6, p0, Lexample/Example$BaseClass;->lastMovementTime:J

    sub-long/2addr v4, v6

    const-wide/16 v6, 0x7530

    cmp-long v3, v4, v6

    if-lez v3, :cond_63

    .line 54
    iput v2, p0, Lexample/Example$BaseClass;->ignition:I

    move v0, v1

    .line 55
    goto :goto_43

    .line 56
    :cond_63
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lexample/Example$BaseClass;->lastSentTime:J

    sub-long/2addr v2, v4

    const-wide/32 v4, 0x1b7740

    cmp-long v2, v2, v4

    if-lez v2, :cond_43

    move v0, v1

    .line 57
    goto :goto_43
.end method

.method public onReceiveLocation(Lexample/Example$BaseClass$Location;)V
    .registers 14

    .prologue
    .line 94
    if-eqz p1, :cond_20

    .line 95
    invoke-virtual {p1}, Lexample/Example$BaseClass$Location;->getAltitude()D

    move-result-wide v4

    .line 96
    invoke-virtual {p1}, Lexample/Example$BaseClass$Location;->getBearing()F

    move-result v6

    .line 97
    invoke-virtual {p1}, Lexample/Example$BaseClass$Location;->getAccuracy()F

    move-result v8

    .line 98
    invoke-virtual {p1}, Lexample/Example$BaseClass$Location;->getLatitude()D

    move-result-wide v0

    .line 99
    invoke-virtual {p1}, Lexample/Example$BaseClass$Location;->getLongitude()D

    move-result-wide v10

    .line 100
    double-to-float v2, v0

    double-to-float v3, v10

    invoke-virtual {p1}, Lexample/Example$BaseClass$Location;->getSpeed()F

    move-result v7

    move-object v1, p0

    invoke-virtual/range {v1 .. v8}, Lexample/Example$BaseClass;->SetGps(FFDFFF)V

    .line 103
    :cond_20
    return-void
.end method

.method public realSetGps(FFFFDI)V
    .registers 13

    .prologue
    .line 74
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "lat:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ";lng:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ",head:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ";speed:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p4}, Ljava/lang/Math;->round(F)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ";alt:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p5, p6}, Ljava/lang/Math;->round(D)J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ";ign:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 75
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "realSetGps:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 77
    return-void
.end method

.method public registerAccSensorListener(Ljava/lang/String;)V
    .registers 5

    .prologue
    const/4 v2, 0x1

    .line 80
    iget-object v0, p0, Lexample/Example$BaseClass;->flagArrayList_AccSensor:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_e

    .line 81
    iget-object v0, p0, Lexample/Example$BaseClass;->flagArrayList_AccSensor:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 83
    :cond_e
    iget-object v0, p0, Lexample/Example$BaseClass;->flagArrayList_AccSensor:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ne v0, v2, :cond_2c

    .line 84
    iget-object v0, p0, Lexample/Example$BaseClass;->service:Landroid/content/Context;

    const-string v1, "sensor"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/SensorManager;

    .line 85
    invoke-virtual {v0, v2}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v0

    iput-object v0, p0, Lexample/Example$BaseClass;->accSensor:Landroid/hardware/Sensor;

    .line 86
    iget-object v0, p0, Lexample/Example$BaseClass;->accSensor:Landroid/hardware/Sensor;

    const/4 v1, 0x3

    invoke-direct {p0, v0, v1}, Lexample/Example$BaseClass;->registerSensorListener(Landroid/hardware/Sensor;I)V

    .line 88
    :cond_2c
    return-void
.end method

.method public test()V
    .registers 10

    .prologue
    .line 106
    iget v2, p0, Lexample/Example$BaseClass;->lastLat:F

    iget v3, p0, Lexample/Example$BaseClass;->lastLng:F

    iget v4, p0, Lexample/Example$BaseClass;->iBearing:F

    iget v5, p0, Lexample/Example$BaseClass;->iSpeed:F

    iget-wide v6, p0, Lexample/Example$BaseClass;->iAltitude:D

    iget v8, p0, Lexample/Example$BaseClass;->ignition:I

    move-object v1, p0

    invoke-virtual/range {v1 .. v8}, Lexample/Example$BaseClass;->realSetGps(FFFFDI)V

    .line 107
    return-void
.end method
