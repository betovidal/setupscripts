Last working version: 0.8.3

No patches needed anymore. Use tmux.

/* gruvbox-dark colorscheme START */
/* Terminal colors (16 first used in escape sequence) */
static const char *colorname[] = {
	"#282828", /* hard contrast: #1d2021 / soft contrast: #32302f */
	"#cc241d",
	"#98971a",
	"#d79921",
	"#458588",
	"#b16286",
	"#689d6a",
	"#a89984",
	"#928374",
	"#fb4934",
	"#b8bb26",
	"#fabd2f",
	"#83a598",
	"#d3869b",
	"#8ec07c",
	"#ebdbb2",
};
unsigned int defaultfg = 15;
unsigned int defaultbg = 0;
static unsigned int defaultcs = 15;
static unsigned int defaultrcs = 15;
/* gruvbox-dark colorscheme FINISH */

/* I used to like this */
char font[] = "Terminus:pixelsize=18";
/* But now I use */
static char *font = "DejaVu Sans Mono for Powerline:pixelsize=25:antialias=true:autohint=true";

Install with: $sudo make clean install
