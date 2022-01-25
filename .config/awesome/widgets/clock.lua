local wibox = require("wibox")  -- Provides the widgets
local awful = require("awful")
local watch = require("awful.widget.watch")
local naughty = require("naughty")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local gears = require("gears")



local clock = {}
local function worker(s)
	clock = wibox.widget {
        widget = wibox.container.margin,
        left = 4,
        right = 4,
        {
            widget = wibox.widget.textclock,
            format = "%H:%M",
            refresh = 1,
            font = "fira Mono Regular 11"
        }
    }


    local time = wibox.container.place(wibox.widget {
        widget = wibox.widget.textclock,
        format = "%H:%M",
        refresh = 1,
        font = "fira Mono Regular " .. dpi(35)
    })

    local date = wibox.container.place(wibox.widget {
        widget = wibox.widget.textclock,
        format = "%A %d %B",
        refresh = 1,
        font = "fira Mono Regular " .. dpi(15),
        halign = 'center'
    })

    local calendar = wibox.container.place(wibox.widget {
        {
            widget = wibox.widget.calendar.month,
            date = os.date("*t"),
            spacing = 10,
            font = "fira Mono Regular " .. dpi(11),
        },
        widget = wibox.container.margin,
        left = dpi(10),
        right = dpi(10),
        top = dpi(40)
    })


    local popup = awful.popup {
        widget = {
            {
                {
                    time,
                    date,
                    {
                        require("widgets.calendar"),
                        widget = wibox.container.margin,
                        top = dpi(30)
                    },
                    layout = wibox.layout.fixed.vertical,
                },
                margins = dpi(30),
                widget  = wibox.container.margin,
            },
            bg = beautiful.popup_background,
			widget = wibox.container.background
        },
        bg = "#00000000",
        border_width = 0,
        ontop = true,
        placement    = function (w)
			awful.placement.bottom_right(w, {
				margins = {left = 0, top = 5, bottom = beautiful.wibar_height + dpi(5), right = dpi(5)},
                parent = s
			})
		end,
        shape        = gears.shape.rounded_rect,
        visible      = false,
    }

    clock:connect_signal("button::press", function(_, _, _, button)
        if (button == 1) then
            popup.visible = not popup.visible
        end
    end)

    


	return clock
end




return worker

