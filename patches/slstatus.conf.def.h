diff --git a/config.def.h b/config.def.h
index 93a875a..ba98d1b 100644
--- a/config.def.h
+++ b/config.def.h
@@ -4,7 +4,7 @@
 const unsigned int interval = 1000;
 
 /* text to show if no value can be retrieved */
-static const char unknown_str[] = "n/a";
+static const char unknown_str[] = "?";
 
 /* maximum output string length */
 #define MAXLEN 2048
@@ -63,7 +63,18 @@ static const char unknown_str[] = "n/a";
  * wifi_perc           WiFi signal in percent          interface name (wlan0)
  * wifi_essid          WiFi ESSID                      interface name (wlan0)
  */
+/* static const char iname[] = "wlan0"; */
+/* static const char bname[] = "BAT1"; */
+static const char iname[] = "enp4s0";
 static const struct arg args[] = {
 	/* function format          argument */
-	{ datetime, "%s",           "%F %T" },
+	/* { battery_state,"%s", bname }, */
+	/* { battery_perc, "b:%3s", bname }, */
+	{ run_command,  "♫:%3s", "/bin/bash -c \"amixer get Master | awk '\\$0~/%/{print \\$4}' | tr -d '[]%'\""},
+	{ netspeed_tx,  "|▲%9s", iname},
+	{ netspeed_rx,  "|▼%9s", iname},
+	{ ram_perc,     "|r:%3s", NULL},
+	{ cpu_perc,     "|c:%3s", NULL},
+	{ ipv4,         "|%s", iname},
+	{ datetime, "%s", "|%F|%a|%T" },
 };
