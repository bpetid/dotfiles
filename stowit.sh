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
	stow -$arg -v environment
	stow -$arg -v fish
	stow -$arg -v hyprland
	stow -$arg -v kitty
	stow -$arg -v mangohud
	stow -$arg -v mpv
	stow -$arg -v nvim
	stow -$arg -v walker
	stow -$arg -v wallpapers -t /usr/share/wallpapers
	stow -$arg -v waybar
	stow -$arg -v wezterm
fi
