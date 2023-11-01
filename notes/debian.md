# WiFi

By default, NetworkManager does not manage interfaces listed in /etc/network/interfaces, so this file should look something like this:

    # This file describes the network interfaces available on your system
    # and how to activate them. For more information, see interfaces(5).
    
    source /etc/network/interfaces.d/*
    
    # The loopback network interface
    auto lo
    iface lo inet loopback
    
    # The primary network interface
    # allow-hotplug wlp2s0
    # iface wlp2s0 inet dhcp
    #   wpa-ssid serbes4
    #   wpa-psk  Abc2474365

Apparently Debian's installation script configures a default interface and writes it to that file. If that's the case NetworkManager won't manage that interface.

Symptoms will be that neither nmtui nor nmcli will list any available networks.

# Environment variables

If using lightdm, lightdm won't read neither ~./profile nor ~/.bash_profile file and looks like it [never will](https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=636108).

For this reason, specifically Debian and Debian derivatives will read ~/.xsesssionrc as explained [here](https://unix.stackexchange.com/a/281923).

That's why .xsessionrc exists and its purpose is to source ~/.profile. Note that everything in .xsessionrc and anything sourced by it should be written in POSIX sh. Be careful to rewrite any vital script to sh or add a "If not bash block then return" at the top of it.

# Ugly fonts in Firefox

Do not install fonts-baekmuk as apparently Firefox uses it instead of the ones provided by each website (e.g. Walmart, Twitter, etc)


