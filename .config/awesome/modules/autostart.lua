local awful = require("awful")
local filesystem = require("gears.filesystem")
local beautiful = require("beautiful")
local naughty = require("naughty")
local startup_apps = {
	'picom --config ~/.config/picom/picom.conf --glx-fshader-win "$(cat ~/.config/picom/shader.glsl)"',
	'setxkbmap -layout gb',
	'/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1',
	'xss-lock --transfer-sleep-lock -- betterlockscreen -l blur',
	"xidlehook --not-when-fullscreen --not-when-audio --timer 300 'betterlockscreen -l dimblur' '' --timer 60 'systemctl suspend' ''",
}

for _, app in ipairs(startup_apps) do
	awful.spawn(string.format("bash -c '%s'", app))
end
