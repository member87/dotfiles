local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local layoutbox = function (s)


	local layoutbox_wrapped = wibox.widget {
		{
			awful.widget.layoutbox(s),
			layout = wibox.layout.fixed.horizontal
		},
		margins = dpi(3),
		widget = wibox.container.margin
	}

	layoutbox_wrapped:buttons(
		gears.table.join(
          	awful.button({ }, 1, function () awful.layout.inc( 1) end),
          	awful.button({ }, 3, function () awful.layout.inc(-1) end),
          	awful.button({ }, 4, function () awful.layout.inc( 1) end),
          	awful.button({ }, 5, function () awful.layout.inc(-1) end)
		)
	)

	return layoutbox_wrapped;
end

return layoutbox