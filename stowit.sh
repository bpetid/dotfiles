#! /usr/bin/env bash
#
if [ "$1" == "-S" ]; then
	arg="S"
elif [ "$1" == "-D" ]; then
	arg="D"
else
	echo "Valid args: -S, -D"
fi

if [ $# = 1 ]; then
	stow -$arg -v documents
	stow -$arg -v environment
	stow -$arg -v kitty
	stow -$arg -v mangohud
	stow -$arg -v mpd
	stow -$arg -v mpv
	stow -$arg -v nvim
	stow -$arg -v pipewire
	stow -$arg -v wallpapers -t /usr/share/wallpapers
fi
