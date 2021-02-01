diff --git a/config.def.h b/config.def.h
index 6f05dce..4769fa3 100644
--- a/config.def.h
+++ b/config.def.h
@@ -5,7 +5,8 @@
  *
  * font: see http://freedesktop.org/software/fontconfig/fontconfig-user.html
  */
-static char *font = "Liberation Mono:pixelsize=12:antialias=true:autohint=true";
+static char *font = "Terminus:pixelsize=28:antialias=true:autohint=true:style=Bold";
+/* static char *font = "DejaVu Sans Mono:pixelsize=25:antialias=true:autohint=true"; */
 static int borderpx = 2;
 
 /*
@@ -91,35 +92,29 @@ char *termname = "st-256color";
  *
  *	stty tabs
  */
-unsigned int tabspaces = 8;
+unsigned int tabspaces = 4;
 
 /* Terminal colors (16 first used in escape sequence) */
 static const char *colorname[] = {
-	/* 8 normal colors */
-	"black",
-	"red3",
-	"green3",
-	"yellow3",
-	"blue2",
-	"magenta3",
-	"cyan3",
-	"gray90",
-
-	/* 8 bright colors */
-	"gray50",
-	"red",
-	"green",
-	"yellow",
-	"#5c5cff",
-	"magenta",
-	"cyan",
-	"white",
-
-	[255] = 0,
-
-	/* more colors can be added after 255 to use with DefaultXX */
-	"#cccccc",
-	"#555555",
+/* 8 normal colors */
+  [0] = "#272822", /* black   */
+  [1] = "#f92672", /* red     */
+  [2] = "#a6e22e", /* green   */
+  [3] = "#f4bf75", /* yellow  */
+  [4] = "#66d9ef", /* blue    */
+  [5] = "#ae81ff", /* magenta */
+  [6] = "#a1efe4", /* cyan    */
+  [7] = "#f8f8f2", /* white   */
+
+  /* 8 bright colors */
+  [8]  = "#75715e", /* black   */
+  [9]  = "#f92672", /* red     */
+  [10] = "#a6e22e", /* green   */
+  [11] = "#f4bf75", /* yellow  */
+  [12] = "#66d9ef", /* blue    */
+  [13] = "#ae81ff", /* magenta */
+  [14] = "#a1efe4", /* cyan    */
+  [15] = "#f9f8f5", /* white   */
 };
 
 
@@ -129,8 +124,8 @@ static const char *colorname[] = {
  */
 unsigned int defaultfg = 7;
 unsigned int defaultbg = 0;
-static unsigned int defaultcs = 256;
-static unsigned int defaultrcs = 257;
+static unsigned int defaultcs = 7;
+static unsigned int defaultrcs = 0;
 
 /*
  * Default shape of cursor
