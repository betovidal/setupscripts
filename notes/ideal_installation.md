# This is what my ideal installation looks like

* Debian, net install. In windows use rufus, in Linux (unmounted device):

```
$mkdosfs /dev/sdX1
$dd if=<file> of=<device> bs=4M; sync
<device> = sdX
```

* https://wiki.debian.org/BootUsb
* https://www.debian.org/CD/faq/#write-up 

* **Read "sources.list" note**

## Packages

Install mode: sudo apt install
I prefer to keep (git) installations under the same folder, i.e. ~/Downloads/git_repositories/

* Add user to sudo: #usermod -aG sudo <user>
* sudo
* gcc (199 MB)
* make
* linux headers (for nVidia drivers): $sudo apt-get install linux-headers-$(uname -r)
* bash-completion
* xorg through **xinit**
* remove *nouveau* (if installing nvidia propietary drivers from nvidia/drivers page
* install mesa-utils to have glx extension enabled!
* restart, nVidia's installer will prompt you to automatically add disable modprobe for nouveau, say yes and restart. Check 'TTY1 output on boot' note for details.
* nVidia propietary drivers (see NVIDIAadditional information)
* To have read+write access to ntfs partitions: ntfs-3g (and reboot)
* git (git-core is an alias to git, so, use git)
* alsa-utils (Check "Additional alsa configuration" note for details).
* pulseaudio (this is a sound server, this solves my problem of a single program being able to use sound output)
* samba access from thunar is gained by installing (gvfs, sshfs, gvfs-backends)
* thunar (and dbus-x11 for volman), ranger, feh, xzoom, cmus, curl, lxappearance, gpick, w3m-img, screenfetch, fim (for viewing images on the framebuffer, tty, fb), slop (region selection), maim (screenshots), nethogs, nload
* (git) From the respective $git clone http://git.suckless.org/[package]: slock, dmenu, st, farbfeld(libjpeg-turbo) -> sent, dwm, slstatus.
* See suckless terminal setup (st) note for configuring st.
* libx11-dev, libxinerama-dev, libxft-dev, libjpeg-dev, libxrandr-dev, libxt-dev
* zathura
* fonts-noto-color-emoji (don't judge me)
* Or better: fonts-symbola (black and white)
* cmark (parse markdown to html and other formats)
* bc (echo "2+2" | bc -l)
* xsel (ranger copy to clipboard)
* xclip -> copy image to clipboard (see scripts)
* winbind libnss-winbind (for seeing windows hostnames)
* For all the suckless packages, the way to install is patches->config.h modifications->$make->$make clean install
* terminus font http://terminus-font.sourceforge.net/, (uncompress with tar -zxvf) follow install instructions under linux (2.1 from the readme: $./configure $make -j4 pcf, $make install-pcf) and replace psf for pcf, attention! PCF is the way to go! After script finishes, run: $sudo dpkg-reconfigure fontconfig-config and enable bitmap fonts.
* (git) vim (see vim configuration)
* (git) fzf
* (.deb from the github page curl.. etc) ripgrep (use it as rg from command line)
* nginx, for web development, you'll use it ;)
* dbus-x11
* dunst (notification daemon, depends on dbus-x11).
* libnotify-bin (example: $notify-send Test "This is a test")
* sxiv (Simple X Image Viewer, open with this, custom command "sixv -a" for animated gifs)
* p7zip-full
