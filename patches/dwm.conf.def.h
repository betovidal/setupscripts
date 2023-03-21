diff --git a/config.def.h b/config.def.h
index 9efa774..9d8a6c1 100644
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
@@ -58,11 +71,52 @@ static const Layout layouts[] = {
 /* commands */
 static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
 static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL };
-static const char *termcmd[]  = { "st", NULL };
+static const char *launchercmd[] = { "rofi", "-monitor", "-1", "-modi", "run,drun", "-show", "run", "-show-icons", "-disable-history", "-scroll-method", "1", NULL };
+/* static const char *termcmd[]  = { "st", NULL }; */
+static const char *termcmd[]  = { "sss", NULL };
+
+/* My commands start */
+static const char *insert_emoji[] = { "rofi", "-monitor", "-1", "-modi", "emoji", "-show", "emoji", "-disable-history", "-scroll-method", "1", NULL };
+static const char *lock_screen[] = { "i3lock", "-u", "-t", "--image", "$HOME/Pictures/lock.png", NULL };
+static const char *prev_track[] = { "musicctl.sh", "prev", NULL };
+static const char *next_track[] = { "musicctl.sh", "next", NULL };
+static const char *play_track[] = { "musicctl.sh", "toggle", NULL };
+static const char *stop_track[] = { "musicctl.sh", "stop", NULL };
+static const char *seek_f_track[] = { "musicctl.sh", "forward", NULL };
+static const char *seek_b_track[] = { "musicctl.sh", "rewind", NULL };
+static const char *find_track[] = { "musicctl.sh", "find", NULL };
+static const char *info_track[] = { "musicctl.sh", "info", NULL };
+static const char *vol_up[] = { "pactl", "set-sink-volume", "@DEFAULT_SINK@", "+5%", NULL };
+static const char *vol_down[] = { "pactl", "set-sink-volume", "@DEFAULT_SINK@", "-5%", NULL };
+static const char *vol_mute[] = { "pactl", "set-sink-mute", "@DEFAULT_SINK@", "toggle", NULL };
+static const char *bright_up[] = { "xbacklight", "-inc", "5", NULL };
+static const char *bright_down[] = { "xbacklight", "-dec", "5", NULL };
+/* My commands end */
 
 static const Key keys[] = {
+	/* My own key bindings START */
+	{ MODKEY|ShiftMask,             XK_KP_Enter,spawn,         {.v = termcmd } },
+	{ 0,                            XK_Print,  spawn,          SHCMD("maim -u | xclip -selection clipboard -t image/png") },
+	{ MODKEY,                       XK_Print,  spawn,          SHCMD("maim -u -s | xclip -selection clipboard -t image/png") },
+	{ 0,                            XF86XK_AudioRaiseVolume,spawn,{.v = vol_up } },
+	{ 0,                            XF86XK_AudioLowerVolume,spawn,{.v = vol_down } },
+	{ 0,                            XF86XK_AudioMute,spawn,       {.v = vol_mute } },
+	{ 0,                            XF86XK_AudioPrev,spawn,       {.v = prev_track } },
+	{ 0,                            XF86XK_AudioNext,spawn,       {.v = next_track } },
+	{ 0,                            XF86XK_AudioPlay,spawn,       {.v = play_track } },
+	{ 0,                            XF86XK_AudioStop,spawn,       {.v = stop_track } },
+	{ MODKEY|ControlMask,           XK_Right,  spawn,          {.v = seek_f_track } },
+	{ MODKEY|ControlMask,           XK_Left,   spawn,          {.v = seek_b_track } },
+	{ MODKEY|ShiftMask,             XK_apostrophe,  spawn,     {.v = info_track } },
+	{ MODKEY,                       XK_apostrophe,  spawn,     {.v = find_track } },
+	{ 0,                            XF86XK_MonBrightnessUp,spawn,{.v = bright_up } },
+	{ 0,                            XF86XK_MonBrightnessDown,spawn,{.v = bright_down } },
+	{ MODKEY,                       XK_e,      spawn,          {.v = insert_emoji } },
+	{ MODKEY,                       XK_q,      spawn,          {.v = lock_screen } },
+	{ MODKEY,                       XK_p,      spawn,          {.v = launchercmd } },
+	/* My own key bindings END */
 	/* modifier                     key        function        argument */
-	{ MODKEY,                       XK_p,      spawn,          {.v = dmenucmd } },
+	/* { MODKEY,                       XK_p,      spawn,          {.v = dmenucmd } }, */
 	{ MODKEY|ShiftMask,             XK_Return, spawn,          {.v = termcmd } },
 	{ MODKEY,                       XK_b,      togglebar,      {0} },
 	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
