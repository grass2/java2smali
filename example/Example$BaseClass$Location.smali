.class Lexample/Example$BaseClass$Location;
.super Ljava/lang/Object;
.source "Example.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lexample/Example$BaseClass;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Location"
.end annotation


# instance fields
.field final synthetic this$0:Lexample/Example$BaseClass;


# direct methods
.method private constructor <init>(Lexample/Example$BaseClass;)V
    .registers 2

    .prologue
    .line 20
    iput-object p1, p0, Lexample/Example$BaseClass$Location;->this$0:Lexample/Example$BaseClass;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getAccuracy()F
    .registers 2

    .prologue
    .line 23
    const/4 v0, 0x0

    return v0
.end method

.method public getAltitude()D
    .registers 3

    .prologue
    .line 21
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getBearing()F
    .registers 2

    .prologue
    .line 22
    const/4 v0, 0x0

    return v0
.end method

.method public getLatitude()D
    .registers 3

    .prologue
    .line 24
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getLongitude()D
    .registers 3

    .prologue
    .line 25
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getSpeed()F
    .registers 2

    .prologue
    .line 26
    const/4 v0, 0x0

    return v0
.end method
