.class public Lexample/Example$DerivedClass;
.super Lexample/Example$BaseClass;
.source "Example.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lexample/Example;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DerivedClass"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 12
    invoke-direct {p0}, Lexample/Example$BaseClass;-><init>()V

    return-void
.end method
