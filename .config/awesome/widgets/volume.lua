local wibox = require("wibox")  -- Provides the widgets
local awful = require("awful")
local watch = require("awful.widget.watch")
local naughty = require("naughty")
local gears = require("gears")
local awesome = awesome


local low = ""
local med = ""
local high = ""

local current_volume = -1
local notification_widget = {}
local function worker(args)
	notification_widget = wibox.widget {
		{
			layout = wibox.layout.fixed.horizontal,
			{
				-- add margin
				widget = wibox.container.margin,
				right = 5,
				top = 2,
				{
					id = 'icon',
					widget = wibox.widget.textbox,
					markup = low,
					align  = 'center',
					valign = 'center',
					font = 'Font Awesome 20'
				}
			}
		},
		layout = wibox.layout.fixed.horizontal,
		update_icon = function(self, volume)
      if not volume then return end
			local widget = self:get_children_by_id('icon')[1]
			if volume < 30 then
				widget:set_markup(low)
			elseif volume < 70 then
				widget:set_markup(med)
			else
				widget:set_markup(high)
			end
		end
	}




	local notification
	watch([[pamixer --get-volume]], 0.1, function(self, volume)
		volume = tonumber(volume)
		if current_volume >= 0 and volume ~= current_volume then
			if notification then
				notification.text = volume .. "%"
				notification:reset_timeout()
			else
				notification = naughty.notify({
					text = volume .. "%",
				})
				notification:connect_signal("destroyed", function()
					notification = nil
				end)
			end
			
		end

		self:update_icon(volume)
		current_volume = tonumber(volume)
	end, notification_widget)


	

	return notification_widget
end





return worker(...)

