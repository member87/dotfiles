local naughty = require("naughty")
local awful = require("awful")
local beautiful = require("beautiful")

naughty.config.spacing = beautiful.notification_spacing
naughty.config.defaults.margin = beautiful.notification_margin
naughty.config.defaults.border_width = beautiful.notification_border_width

