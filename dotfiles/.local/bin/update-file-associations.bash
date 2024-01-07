#!/usr/bin/env bash

# Query current file associations, e.g.: $xdg-mime query default video/mp4

# Documents
xdg-mime default org.gnome.Evince.desktop application/pdf
xdg-mime default cr3.desktop application/epub+zip
#.doc      application/msword
#.dot      application/msword
#.docx     application/vnd.openxmlformats-officedocument.wordprocessingml.document
#.dotx     application/vnd.openxmlformats-officedocument.wordprocessingml.template
#.docm     application/vnd.ms-word.document.macroEnabled.12
#.dotm     application/vnd.ms-word.template.macroEnabled.12
xdg-mime default libreoffice-writer.desktop application/msword
xdg-mime default libreoffice-writer.desktop application/msword
xdg-mime default libreoffice-writer.desktop application/vnd.openxmlformats-officedocument.wordprocessingml.document
xdg-mime default libreoffice-writer.desktop application/vnd.openxmlformats-officedocument.wordprocessingml.template
xdg-mime default libreoffice-writer.desktop application/vnd.ms-word.document.macroEnabled.12
xdg-mime default libreoffice-writer.desktop application/vnd.ms-word.template.macroEnabled.12
# Images + Linked .desktop file to open it with the -a flag (for gifs).
xdg-mime default sxiv.desktop image/gif
xdg-mime default sxiv.desktop image/png
xdg-mime default sxiv.desktop image/jpg
xdg-mime default sxiv.desktop image/jpeg
xdg-mime default sxiv.desktop image/bmp
