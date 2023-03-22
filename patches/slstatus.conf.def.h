diff --git a/config.def.h b/config.def.h
index d805331..bd78c9c 100644
--- a/config.def.h
+++ b/config.def.h
@@ -4,7 +4,8 @@
 const unsigned int interval = 1000;
 
 /* text to show if no value can be retrieved */
-static const char unknown_str[] = "n/a";
+/* static const char unknown_str[] = "n/a"; */
+static const char unknown_str[] = "";
 
 /* maximum output string length */
 #define MAXLEN 2048
@@ -63,7 +64,28 @@ static const char unknown_str[] = "n/a";
  * wifi_essid          WiFi ESSID                      interface name (wlan0)
  * wifi_perc           WiFi signal in percent          interface name (wlan0)
  */
+
+/* LAPTOP */
+static const char iname_wifi[] = "wlp2s0";
+/* static const char iname_eth[] = "enp1s0"; */
+static const char bname[] = "BAT0";
+/* PC */
+static const char iname_eth[] = "enp4s0";
+/* BOTH */
+static const char tun_vpnc[] = "tun0";
+static const char tun_mull[] = "wg-mullvad";
+
 static const struct arg args[] = {
 	/* function format          argument */
-	{ datetime, "%s",           "%F %T" },
+	/* LAPTOP */
+	{ battery_state,"%s", bname },
+	{ battery_perc, "b:%3s", bname },
+	{ run_command,  "|♫:%3s", "/bin/bash -c \"amixer get Master | awk '\\$0~/%/{print \\$5}' | tr -d '[]%'\""},
+	{ netspeed_tx,  "|▲%9s", iname_wifi},
+	{ netspeed_rx,  "|▼%9s", iname_wifi},
+	{ netspeed_tx,  "|▲%9s", iname_eth},
+	{ netspeed_rx,  "|▼%9s", iname_eth},
+	{ ram_perc,     "|r:%3s", NULL},
+	{ cpu_perc,     "|c:%3s", NULL},
+	{ datetime, "%s", "|%F|%a|%T" },
 };
