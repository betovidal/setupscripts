diff --git a/config.def.h b/config.def.h
index 9efa774..ce7e211 100644
--- a/config.def.h
+++ b/config.def.h
@@ -1,17 +1,28 @@
 /* See LICENSE file for copyright and license details. */
+#include <X11/XF86keysym.h>
 
 /* appearance */
-static const unsigned int borderpx  = 1;        /* border pixel of windows */
+/* static const unsigned int borderpx  = 1;        /1* border pixel of windows *1/ */
+static const unsigned int borderpx  = 2;        /* border pixel of windows */
 static const unsigned int snap      = 32;       /* snap pixel */
 static const int showbar            = 1;        /* 0 means no bar */
 static const int topbar             = 1;        /* 0 means bottom bar */
-static const char *fonts[]          = { "monospace:size=10" };
-static const char dmenufont[]       = "monospace:size=10";
+/* static const char *fonts[]          = { "monospace:size=10" }; */
+/* static const char dmenufont[]       = "monospace:size=10"; */
+/* static const char *fonts[]          = { "DejaVu Sans Mono:pixelsize=21" }; */
+/* static const char dmenufont[]       = "DejaVu Sans Mono:pixelsize=21"; */
+/* static const char col_gray1[]       = "#222222"; */
+/* static const char col_gray2[]       = "#444444"; */
+/* static const char col_gray3[]       = "#bbbbbb"; */
+/* static const char col_gray4[]       = "#eeeeee"; */
+/* static const char col_cyan[]        = "#005577"; */
+static const char *fonts[]          = { "Terminus:pixelsize=24:style=Bold" };
+static const char dmenufont[]       = "Terminus:pixelsize=24:style=Bold";
 static const char col_gray1[]       = "#222222";
 static const char col_gray2[]       = "#444444";
 static const char col_gray3[]       = "#bbbbbb";
 static const char col_gray4[]       = "#eeeeee";
-static const char col_cyan[]        = "#005577";
+static const char col_cyan[]        = "#833c9f";
 static const char *colors[][3]      = {
 	/*               fg         bg         border   */
 	[SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
@@ -27,8 +38,9 @@ static const Rule rules[] = {
 	 *	WM_NAME(STRING) = title
 	 */
 	/* class      instance    title       tags mask     isfloating   monitor */
-	{ "Gimp",     NULL,       NULL,       0,            1,           -1 },
-	{ "Firefox",  NULL,       NULL,       1 << 8,       0,           -1 },
+	/* { "Gimp",     NULL,       NULL,       0,            1,           -1 }, */
+	/* { "Firefox",  NULL,       NULL,       1 << 8,       0,           -1 }, */
+	{ NULL,       NULL,       NULL,       0,            False,       -1 },
 };
 
 /* layout(s) */
@@ -45,7 +57,8 @@ static const Layout layouts[] = {
 };
 
 /* key definitions */
-#define MODKEY Mod1Mask
+/* #define MODKEY Mod1Mask */
+#define MODKEY Mod4Mask
 #define TAGKEYS(KEY,TAG) \
 	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
 	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
@@ -58,11 +71,55 @@ static const Layout layouts[] = {
 /* commands */
 static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
 static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL };
-static const char *termcmd[]  = { "st", NULL };
+/* static const char *termcmd[]  = { "st", NULL }; */
+
+/* My commands start */
+static const char *termcmd[]  = { "sss", NULL };
+static const char *bright_up[] = { "kbinds.bash", "bright", "up", NULL };
+static const char *bright_down[] = { "kbinds.bash", "bright", "down", NULL };
+static const char *emoji_insert[] = { "kbinds.bash", "emoji", NULL };
+static const char *launchercmd[] = { "kbinds.bash", "launcher", NULL };
+static const char *screen_lock[] = { "kbinds.bash", "lock", NULL };
+static const char *music_prev[] = { "kbinds.bash", "music", "prev", NULL };
+static const char *music_next[] = { "kbinds.bash", "music", "next", NULL };
+static const char *music_play[] = { "kbinds.bash", "music", "toggle", NULL };
+static const char *music_stop[] = { "kbinds.bash", "music", "stop", NULL };
+static const char *music_rwd[] = { "kbinds.bash", "music", "rewind", NULL };
+static const char *music_fwd[] = { "kbinds.bash", "music", "forward", NULL };
+static const char *music_find[] = { "kbinds.bash", "music", "find", NULL };
+static const char *music_info[] = { "kbinds.bash", "music", "info", NULL };
+static const char *scr_cap_sel_cb[] = { "kbinds.bash", "screen_cap", "sel_cb", NULL };
+static const char *scr_cap_all_cb[] = { "kbinds.bash", "screen_cap", "all_cb", NULL };
+static const char *vol_up[] = { "kbinds.bash", "vol", "up", NULL };
+static const char *vol_down[] = { "kbinds.bash", "vol", "down", NULL };
+static const char *vol_mute[] = { "kbinds.bash", "vol", "mute", NULL };
+/* My commands end */
 
 static const Key keys[] = {
+	/* My own key bindings START */
+	/* { MODKEY          , XK_p                     , spawn , {.v = dmenucmd } }       , */
+	{ MODKEY|ShiftMask   , XK_KP_Enter              , spawn , {.v = termcmd } }        ,
+	{ 0                  , XF86XK_MonBrightnessUp   , spawn , {.v = bright_up } }      ,
+	{ 0                  , XF86XK_MonBrightnessDown , spawn , {.v = bright_down } }    ,
+	{ MODKEY             , XK_e                     , spawn , {.v = emoji_insert } }   ,
+	{ MODKEY             , XK_p                     , spawn , {.v = launchercmd } }    ,
+	{ MODKEY             , XK_q                     , spawn , {.v = screen_lock } }    ,
+	{ 0                  , XF86XK_AudioPrev         , spawn , {.v = music_prev } }     ,
+	{ 0                  , XF86XK_AudioNext         , spawn , {.v = music_next } }     ,
+	{ 0                  , XF86XK_AudioPlay         , spawn , {.v = music_play } }     ,
+	{ 0                  , XF86XK_AudioStop         , spawn , {.v = music_stop } }     ,
+	{ MODKEY|ControlMask , XK_Left                  , spawn , {.v = music_rwd } }   ,
+	{ MODKEY|ControlMask , XK_Right                 , spawn , {.v = music_fwd } }   ,
+	{ MODKEY             , XK_apostrophe            , spawn , {.v = music_find } }     ,
+	{ MODKEY|ShiftMask   , XK_apostrophe            , spawn , {.v = music_info } }     ,
+	{ MODKEY             , XK_Print                 , spawn , {.v = scr_cap_sel_cb } } ,
+	{ 0                  , XK_Print                 , spawn , {.v = scr_cap_all_cb } } ,
+	{ 0                  , XF86XK_AudioRaiseVolume  , spawn , {.v = vol_up } }         ,
+	{ 0                  , XF86XK_AudioLowerVolume  , spawn , {.v = vol_down } }       ,
+	{ 0                  , XF86XK_AudioMute         , spawn , {.v = vol_mute } }       ,
+	/* My own key bindings END */
 	/* modifier                     key        function        argument */
-	{ MODKEY,                       XK_p,      spawn,          {.v = dmenucmd } },
+	/* { MODKEY,                       XK_p,      spawn,          {.v = dmenucmd } }, */
 	{ MODKEY|ShiftMask,             XK_Return, spawn,          {.v = termcmd } },
 	{ MODKEY,                       XK_b,      togglebar,      {0} },
 	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
