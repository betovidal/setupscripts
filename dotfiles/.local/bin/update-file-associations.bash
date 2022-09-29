#!/usr/bin/env bash

# Query current file associations, e.g.: $xdg-mime query default video/mp4

# Documents
xdg-mime default org.pwmt.zathura.desktop application/pdf
xdg-mime default cr3.desktop application/epub+zip
# Images + Linked .desktop file to open it with the -a flag (for gifs).
xdg-mime default sxiv.desktop image/gif
xdg-mime default sxiv.desktop image/png
xdg-mime default sxiv.desktop image/jpg
xdg-mime default sxiv.desktop image/jpeg
xdg-mime default sxiv.desktop image/bmp
