/* Read: "Additional alsa configuration" note for volume. */

static const char unknown_str[] = "?";

static const char iname[] = "wlan0";
static const char bname[] = "BAT1";
/* static const char iname[] = "enp3s0"; */
static const struct arg args[] = {
	/* function format          argument */
	{ battery_state,"%s", bname },
	{ battery_perc, "b:%3s", bname },
	{ run_command,  "|♫:%3s", "/bin/bash -c \"amixer get Master | awk '\\$0~/%/{print \\$5}' | tr -d '[]%'\""},
	{ netspeed_tx,  "|▲%9s", iname},
	{ netspeed_rx,  "|▼%9s", iname},
	{ ram_perc,     "|r:%3s", NULL},
	{ cpu_perc,     "|c:%3s", NULL},
	{ ipv4,         "|%s", iname},
	{ datetime, "%s", "|%F|%a|%T" },
};
