#!/bin/bash

# Basically what I want is: disable and stop all system level mpd services
# (mpd.service and mpd.socket) and make sure to start and enable at user level
# mpd.service and disable and stop mpd.socket.

systemctl   --user      enable    mpd.service

systemctl   --user      disable   mpd.socket
systemctl   --user      stop      mpd.socket

sudo        systemctl   stop      mpd.service
sudo        systemctl   disable   mpd.service

sudo        systemctl   stop      mpd.socket
sudo        systemctl   disable   mpd.socket

systemctl   --user      restart   mpd.service
