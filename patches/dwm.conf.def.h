/* Apply https://dwm.suckless.org/patches/canfocusrule/ */

static const char *fonts[]          = { "DejaVu Sans Mono for Powerline:pixelsize=16" };
static const char dmenufont[]       = "DejaVu Sans Mono for Powerline:pixelsize=16";

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* No rules at all                                                                 */
	/* { NULL,       NULL,       NULL,       0,            0,          1/0       -1 }, */
	/* class      instance    title       tags mask     isfloating  canfocus monitor   */
	{
		"Microsoft Teams - Preview",
		"microsoft teams - preview",
		"Microsoft Teams",
		0,
		0,
		1,
		-1
	},
	/* Notifications (reply previews, reactions) */
	{
		"Microsoft Teams - Preview",
		"microsoft teams - preview",
		"Microsoft Teams Notification",
		0,
		1,
		0,
		0
	},
};

........................


/* commands */
static const char *insert_emoji[] = { "splatmoji", "type", NULL };
static const char *mouse_up[] = { "xdotool", "mousemove_relative", "--", "0", "-15", NULL };
static const char *mouse_right[] = { "xdotool", "mousemove_relative", "--", "15", "0", NULL };
static const char *mouse_down[] = { "xdotool", "mousemove_relative", "--", "0", "15", NULL };
static const char *mouse_left[] = { "xdotool", "mousemove_relative", "--", "-15", "0", NULL };
static const char *click_left[] = { "xdotool", "click", "1", NULL };
static const char *click_right[] = { "xdotool", "click", "3", NULL };
static const char *prev_track[] = { "cmus-remote", "-r", NULL };
static const char *next_track[] = { "cmus-remote", "-n", NULL };
static const char *play_track[] = { "cmus-remote", "-p", NULL };
static const char *pause_track[] = { "cmus-remote", "-u", NULL };
static const char *stop_track[] = { "cmus-remote", "-s", NULL };
static const char *seek_f_track[] = { "cmus-remote", "-k", "+5", NULL };
static const char *seek_b_track[] = { "cmus-remote", "-k", "-5", NULL };
static const char *vol_up[] = { "amixer", "-q", "sset", "Master", "5%+", NULL };
static const char *vol_down[] = { "amixer", "-q", "sset", "Master", "5%-", NULL };

static Key keys[] = {
	/* modifier                     key        function        argument */
	/* My own key bindings START */
	{ MODKEY|ShiftMask,             XK_KP_Enter,spawn,         {.v = termcmd } },
	{ 0,                            XK_Print,  spawn,          SHCMD("maim ~/Pictures/caps/$(date '+%s').png") },
	/* scrot selection to clipboard */
	{ MODKEY,                       XK_Print,  spawn,          SHCMD("maim -s | xclip -selection clipboard -t image/png") },
	{ MODKEY,                       XK_plus,   spawn,          {.v = vol_up } },
	{ MODKEY,                       XK_KP_Add, spawn,          {.v = vol_up } },
	{ MODKEY,                       XK_minus,  spawn,          {.v = vol_down } },
	{ MODKEY,                       XK_KP_Subtract, spawn,     {.v = vol_down } },
	{ MODKEY|ControlMask,           XK_z,      spawn,          {.v = prev_track } },
	{ MODKEY|ControlMask,           XK_b,      spawn,          {.v = next_track } },
	{ MODKEY|ControlMask,           XK_x,      spawn,          {.v = play_track } },
	{ MODKEY|ControlMask,           XK_c,      spawn,          {.v = pause_track } },
	{ MODKEY|ControlMask,           XK_v,      spawn,          {.v = stop_track } },
	{ MODKEY|ControlMask,           XK_Right,  spawn,          {.v = seek_f_track } },
	{ MODKEY|ControlMask,           XK_Left,   spawn,          {.v = seek_b_track } },
	{ MODKEY|ControlMask,           XK_h,      spawn,          {.v = mouse_left } },
	{ MODKEY|ControlMask,           XK_j,      spawn,          {.v = mouse_down } },
	{ MODKEY|ControlMask,           XK_k,      spawn,          {.v = mouse_up } },
	{ MODKEY|ControlMask,           XK_l,      spawn,          {.v = mouse_right } },
	{ MODKEY|ControlMask,           XK_space,  spawn,          {.v = click_left } },
	{ MODKEY|ControlMask|ShiftMask, XK_space,  spawn,          {.v = click_right } },
	{ MODKEY,                       XK_e,  spawn,              {.v = insert_emoji } },
	/* My own key bindings END */

