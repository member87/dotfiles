local wibox = require("wibox")  -- Provides the widgets
local awful = require("awful")
local watch = require("awful.widget.watch")
local naughty = require("naughty")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local gears = require("gears")


local notification_list = {}
local notification = {}


local function worker(s)
	notification_button = wibox.widget {
        widget = wibox.container.margin,
        left = 4,
        right = 4,
        top = 4,
        {
            widget = wibox.widget.textbox,
            markup = '  ',
            align  = 'center',
            valign = 'center',
            font = 'Font Awesome 5 Brands 16'
        }
    }


    local time = wibox.container.place(wibox.widget {
        widget = wibox.widget.textclock,
        format = "%H:%M",
        refresh = 1,
        font = "fira Mono Regular " .. dpi(35)
    })



    local notification_contianer = wibox.layout.fixed.vertical()
    
    
    local popup = awful.popup {
        widget = {
            {
                {
                    notification_contianer,
                    layout = wibox.container.scroll.vertical,
                    speed = 100,
                    max_size = 500,
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
				margins = {left = 0, top = 5, bottom = beautiful.wibar_height + dpi(5), right = dpi(5)}
			})
		end,
        shape        = gears.shape.rounded_rect,
        visible      = false,
    }



    notification_button:connect_signal("button::press", function(self, _, _, button)
        popup.visible = not popup.visible
    end)

    -- naughty connect signal added
    naughty.connect_signal("added", function(n)
        notification_list:insert(n)
    end)




	return notification_button
end







return worker

