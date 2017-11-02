#!/bin/bash
if [ `hostname -s` == pavilion ]; then
    xbacklight -set 100 &
    sh ~/.fehbg &
    #compton --config ~/.i3/compton.conf &
    xautolock -time 10 -locker 'i3lock -c 000000' &
    setxkbmap gb &
    xrandr --output HDMI1 --right-of LVDS1 &
    i3-msg 'workspace 1: WWW; exec /usr/bin/firefox'
    sleep 2
    i3-msg 'workspace 2: IM; exec /usr/bin/urxvt -e tmux'
    sleep 2
    i3-msg 'workspace 3: Shell; exec /usr/bin/urxvt'

elif [ `hostname -s` == matthew-biglaptop ]; then
    xbacklight -set 100 &
    sh ~/.fehbg &
    #compton --config ~/.i3/compton.conf &
    xautolock -time 10 -locker 'i3lock -c 000000' &
    setxkbmap gb &
    #xrandr --output HDMI1 --right-of LVDS1 &
    i3-msg 'workspace 1: WWW; exec /usr/bin/firefox'
    sleep 2
    i3-msg 'workspace 2: IM; exec /usr/bin/urxvt -e tmux'
    sleep 2
    i3-msg 'workspace 3: Shell; exec /usr/bin/urxvt'

else
    xbacklight -set 100 &
    sh ~/.fehbg &
    #compton --config ~/.i3/compton.conf &
    xautolock -time 10 -locker 'i3lock -c 000000' &
    setxkbmap gb &
    #xrandr --output HDMI1 --right-of LVDS1 &
    i3-msg 'workspace 1: WWW; exec /usr/bin/firefox'
    sleep 2
    i3-msg 'workspace 2: IM; exec /usr/bin/urxvt -e tmux'
    sleep 2
    i3-msg 'workspace 3: Shell; exec /usr/bin/urxvt'
fi
