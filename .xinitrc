#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/Xresources
sysmodmap=/etc/X11/xinit/Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then


    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then


    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs


if [ -n "`/etc/X11/chooser.sh`" ]; then
	command="`/etc/X11/chooser.sh`"
else
	failsafe="yes"
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
	for f in /etc/X11/xinit/xinitrc.d/?* ; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi
        xrdb -merge "${HOME}/.Xresources"
       # nitrogen --restore &
       # eval $(cat ~/.fehbg)
       xbindkeys &
      # ~/.keymap.sh --:2
if [ -n "$failsafe" ]; then
#	twm &
#	xclock -geometry 50x50-1+1 &
#	xterm -geometry 80x50+494+51 &
#	xterm -geometry 80x20+494-0 &
#	exec xterm -geometry 80x66+0+0 -name login
       #xrandr --output VGA1 --auto --right-of LVDS1
       setxkbmap -layout "us,ru" 
       #setxkbmap -option "grp:caps_toggle,grp_led:scroll"
       setxkbmap -option "grp:alt_shift_toggle,grp_led:scroll"
	xsetroot -cursor_name left_ptr &
	xsetroot -cursor_name Blue &
	xset m 2 1 &
	export PATH=~/bin:$PATH
       ~/.autostart &
       #exec ck-launch-session dbus-launch --sh-syntax --exit-with-session fvwm2
       exec ck-launch-session dbus-launch --sh-syntax --exit-with-session xmonad
       #exec ck-launch-session dbus-launch --sh-syntax --exit-with-session spectrwm
       #exec ck-launch-session dbus-launch --sh-syntax --exit-with-session wmaker
       #exec fusion-icon
       #lxpanel & 
       #urxvtd &
       #tint2 &
       #xcompmgr -cCfF -t-5 -l-5 -r4.2 -o.55 -D3 &
       #nitrogen --restore &
       #unclutter -root &
       #slstatus -d &
       #yeahconsole &
       #exec ck-launch-session dbus-launch --sh-syntax --exit-with-session dwm
       #i3status &
       #exec ck-launch-session dbus-launch --sh-syntax --exit-with-session i3
       # exec ck-launch-session dbus-launch startxfce4
       # exec ck-launch-session dbus-launch startlxde
       # tint2 &
       # launchy
       # xcompmgr -cCfF -r7 -o.65 -l-10 -D7 &
       # exec xmonad
       # sxhkd &
       # exec bspwm
       # tint2 &
       # fbpanel
       # exec ck-launch-session dbus-launch --sh-syntax --exit-with-session awesome
       # exec ck-launch-session dbus-launch --sh-syntax --exit-with-session pekwm
       # exec ck-launch-session dbus-launch --sh-syntax --exit-with-session notion
       # exec ck-launch-session dbus-launch --sh-syntax --exit-with-session wmii
       # exec ck-launch-session dbus-launch --sh-syntax --exit-with-session startfluxbox
       # exec ck-launch-session dbus-launch --sh-syntax --exit-with-session openbox-session
       # nm-applet &
       # exec ck-launch-session dbus-launch --sh-syntax --exit-with-session wmaker
       #compton -cCfz -r8 -t-10 -l-7 -o 0.5 -m 0.8 -i 0.9 -e 0.6 -D7 --inactive-dim 0.3 --shadow-blue 0.6 &
       #compton -cCfz -r8 -t-10 -l-7 -o 0.5 -m 0.8 -i 0.9 -e 0.6 -D7 --inactive-dim 0.3 --shadow-green 0.6 &
       #compton -cCfz -r8 -t-10 -l-7 -o 0.5 -m 0.8 -i 0.9 -e 0.6 -D7 --inactive-dim 0.3 --shadow-red 0.6 &
       #urxvtd &
       #unclutter -root &
       #nitrogen --restore &
       #yeahconsole &
       #exec ck-launch-session dbus-launch --sh-syntax --exit-with-session startfvwm2
       #exec ck-launch-session dbus-launch --sh-syntax --exit-with-session startlxde
       # exec ck-launch-session dbus-launch --sh-syntax --exit-with-session icewm-session
       #exec ck-launch-session dbus-launch --sh-syntax --exit-with-session subtle
       # exec ck-launch-session dbus-launch --sh-syntax --exit-with-session afterstep
else
	exec $command
fi
