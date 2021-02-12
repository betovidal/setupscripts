diff --git a/config.def.h b/config.def.h
index c2a0ab2..0d656fc 100644
--- a/config.def.h
+++ b/config.def.h
@@ -3,19 +3,19 @@ static const char *user  = "nobody";
 static const char *group = "nogroup";
 
 static const char *colorname[NUMCOLS] = {
-	[INIT] =   "black",     /* after initialization */
-	[INPUT] =  "#005577",   /* during input */
-	[FAILED] = "#CC3333",   /* wrong password */
+	[INIT] =   "#000000", /* after initialization */
+	[INPUT] =  "#003000", /* during input */
+	[FAILED] = "#300000", /* wrong password */
 };
 
 /* treat a cleared input like a wrong password (color) */
-static const int failonclear = 1;
+static const int failonclear = 0;
 
 /* default message */
-static const char * message = "Suckless: Software that sucks less.";
+static const char * message = "Hey you with the pretty face\n\tWelcome to the human race";
 
 /* text color */
 static const char * text_color = "#ffffff";
 
 /* text size (must be a valid size) */
-static const char * font_name = "6x10";
+static const char * font_name = "-*-terminus-*-*-*-*-32-*-*-*-*-*-*-*";
