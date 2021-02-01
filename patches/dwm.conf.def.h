diff --git a/config.def.h b/config.def.h
index 1c0b587..12273d6 100644
--- a/config.def.h
+++ b/config.def.h
@@ -5,8 +5,10 @@ static const unsigned int borderpx  = 1;        /* border pixel of windows */
 static const unsigned int snap      = 32;       /* snap pixel */
 static const int showbar            = 1;        /* 0 means no bar */
 static const int topbar             = 1;        /* 0 means bottom bar */
-static const char *fonts[]          = { "monospace:size=10" };
-static const char dmenufont[]       = "monospace:size=10";
+/* static const char *fonts[]          = { "DejaVu Sans Mono:pixelsize=21" }; */
+/* static const char dmenufont[]       = "DejaVu Sans Mono:pixelsize=21"; */
+static const char *fonts[]          = { "Terminus:pixelsize=24:style=Bold" };
+static const char dmenufont[]       = "Terminus:pixelsize=24:style=Bold";
 static const char col_gray1[]       = "#222222";
 static const char col_gray2[]       = "#444444";
 static const char col_gray3[]       = "#bbbbbb";
@@ -27,8 +29,7 @@ static const Rule rules[] = {
 	 *	WM_NAME(STRING) = title
 	 */
 	/* class      instance    title       tags mask     isfloating   monitor */
-	{ "Gimp",     NULL,       NULL,       0,            1,           -1 },
-	{ "Firefox",  NULL,       NULL,       1 << 8,       0,           -1 },
+	{ NULL,       NULL,       NULL,       0,            False,       -1 },
 };
 
 /* layout(s) */
@@ -55,12 +56,52 @@ static const Layout layouts[] = {
 #define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }
 
 /* commands */
+static const char *insert_emoji[] = { "splatmoji", "type", NULL };
+static const char *mouse_up[] = { "xdotool", "mousemove_relative", "--", "0", "-15", NULL };
+static const char *mouse_right[] = { "xdotool", "mousemove_relative", "--", "15", "0", NULL };
+static const char *mouse_down[] = { "xdotool", "mousemove_relative", "--", "0", "15", NULL };
+static const char *mouse_left[] = { "xdotool", "mousemove_relative", "--", "-15", "0", NULL };
+static const char *click_left[] = { "xdotool", "click", "1", NULL };
+static const char *click_right[] = { "xdotool", "click", "3", NULL };
+static const char *prev_track[] = { "cmus-remote", "-r", NULL };
+static const char *next_track[] = { "cmus-remote", "-n", NULL };
+static const char *play_track[] = { "cmus-remote", "-p", NULL };
+static const char *pause_track[] = { "cmus-remote", "-u", NULL };
+static const char *stop_track[] = { "cmus-remote", "-s", NULL };
+static const char *seek_f_track[] = { "cmus-remote", "-k", "+5", NULL };
+static const char *seek_b_track[] = { "cmus-remote", "-k", "-5", NULL };
+static const char *vol_up[] = { "amixer", "-q", "sset", "Master", "5%+", NULL };
+static const char *vol_down[] = { "amixer", "-q", "sset", "Master", "5%-", NULL };
 static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
 static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL };
 static const char *termcmd[]  = { "st", NULL };
 
 static Key keys[] = {
 	/* modifier                     key        function        argument */
+	/* My own key bindings START */
+	{ MODKEY|ShiftMask,             XK_KP_Enter,spawn,         {.v = termcmd } },
+	{ 0,                            XK_Print,  spawn,          SHCMD("maim ~/Pictures/caps/$(date '+%s').png") },
+	/* scrot selection to clipboard */
+	{ MODKEY,                       XK_Print,  spawn,          SHCMD("maim -s | xclip -selection clipboard -t image/png") },
+	{ MODKEY,                       XK_plus,   spawn,          {.v = vol_up } },
+	{ MODKEY,                       XK_KP_Add, spawn,          {.v = vol_up } },
+	{ MODKEY,                       XK_minus,  spawn,          {.v = vol_down } },
+	{ MODKEY,                       XK_KP_Subtract, spawn,     {.v = vol_down } },
+	{ MODKEY|ControlMask,           XK_z,      spawn,          {.v = prev_track } },
+	{ MODKEY|ControlMask,           XK_b,      spawn,          {.v = next_track } },
+	{ MODKEY|ControlMask,           XK_x,      spawn,          {.v = play_track } },
+	{ MODKEY|ControlMask,           XK_c,      spawn,          {.v = pause_track } },
+	{ MODKEY|ControlMask,           XK_v,      spawn,          {.v = stop_track } },
+	{ MODKEY|ControlMask,           XK_Right,  spawn,          {.v = seek_f_track } },
+	{ MODKEY|ControlMask,           XK_Left,   spawn,          {.v = seek_b_track } },
+	{ MODKEY|ControlMask,           XK_h,      spawn,          {.v = mouse_left } },
+	{ MODKEY|ControlMask,           XK_j,      spawn,          {.v = mouse_down } },
+	{ MODKEY|ControlMask,           XK_k,      spawn,          {.v = mouse_up } },
+	{ MODKEY|ControlMask,           XK_l,      spawn,          {.v = mouse_right } },
+	{ MODKEY|ControlMask,           XK_space,  spawn,          {.v = click_left } },
+	{ MODKEY|ControlMask|ShiftMask, XK_space,  spawn,          {.v = click_right } },
+	{ MODKEY,                       XK_e,  spawn,              {.v = insert_emoji } },
+	/* My own key bindings END */
 	{ MODKEY,                       XK_p,      spawn,          {.v = dmenucmd } },
 	{ MODKEY|ShiftMask,             XK_Return, spawn,          {.v = termcmd } },
 	{ MODKEY,                       XK_b,      togglebar,      {0} },
