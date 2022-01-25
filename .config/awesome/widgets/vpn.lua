local wibox = require("wibox")  -- Provides the widgets
local awful = require("awful")
local watch = require("awful.widget.watch")
local naughty = require("naughty")
local gears = require("gears")
local awesome = awesome
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi


local icon = ""


local connect_cmd = "nordvpn c"
local disconnec_cmd = "nordvpn d"

local connected = false
local vpn_widget = {}
local worker = function (s)

    local info = wibox.widget {
        widget = wibox.container.margin,
        left = 4,
        right = 4,
        {
            id = 'info',
            widget = wibox.widget.textbox,
            font = "Fira Mono Regular 11",
            markup = '',
        },
        update_info = function(self, info)
            local output = ''
            info = gears.string.xml_escape(info)
            for k, v in pairs(gears.string.split(info, '\n')) do
                local line = gears.string.split(v, ':')
                if line[1] and line[2] then
                    output = output .. string.format("<b>%s:</b> %s\n", line[1], line[2])
                end
            end

            self:get_children_by_id('info')[1].markup = output
        end
    }

    local toggle_connect = wibox.widget {
        widget = wibox.container.margin,
        {
            {
                widget = wibox.container.margin,
                margins = 5,
                {
                    id = 'info',
                    widget = wibox.widget.textbox,
                    font = "Fira Mono Regular 11",
                    markup = 'Connect',
                }
            },
            bg = "#339441",
			widget = wibox.container.background,
            shape = gears.shape.rounded_rect,
            opacity = 0.8,
            id = 'bg',
        },
        update_info = function(self, state)
            local bg = self:get_children_by_id('bg')[1]
            local info = self:get_children_by_id('info')[1]
            if state then
                bg.bg = "#c40d00"
                info.markup = 'Disconnect'
            else
                bg.bg = "#339441"
                info.markup = 'Connect'
            end
        end
    }


    local old_cursor, old_wibox
    toggle_connect:connect_signal("mouse::enter", function()
        widget = toggle_connect:get_children_by_id('bg')[1]
        widget.opacity = 1
        local wb = mouse.current_wibox
    	old_cursor, old_wibox = wb.cursor, wb
    	wb.cursor = "hand2"
    end)

    toggle_connect:connect_signal("mouse::leave", function()
        widget = toggle_connect:get_children_by_id('bg')[1]
        widget.opacity = 0.8
        if old_wibox then
        	old_wibox.cursor = old_cursor
        	old_wibox = nil
    	end
    end)

    toggle_connect:connect_signal("button::press", function()
        if connected then
            awful.spawn.easy_async(disconnec_cmd, function(stdout, stderr, reason, exit_code)
                connected = false
                toggle_connect:update_info(connected)
            end)
        else
            awful.spawn.easy_async(connect_cmd, function(stdout, stderr, reason, exit_code)
                connected = true
                toggle_connect:update_info(connected)
            end)
        end
    end)



	vpn_widget = wibox.widget {
		{
			layout = wibox.layout.fixed.horizontal,
			{
				-- add margin
				widget = wibox.container.margin,
				right = 6,
				top = 2,
				{
					id = 'icon',
					widget = wibox.widget.textbox,
					markup = icon,
					align  = 'center',
					valign = 'center',
					font = 'Font Awesome 10'
				}
			}
		},
		layout = wibox.layout.fixed.horizontal,
		update_icon = function(self, state)
            local widget = self:get_children_by_id('icon')[1]
            if state then
                widget.markup = '<span color="#fff">' .. icon .. '</span>'
            else
                widget.markup = '<span color="#666">' .. icon .. '</span>'
            end
		end,
	}

    

    local popup = awful.popup {
        widget = {
            {
                {
                    info,
                    toggle_connect,
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

    popup:connect_signal("mouse::leave", function() popup.visible = false end)

    



	watch([[nordvpn status]], 1, function(self, status)
        local is_connected = string.match(status, 'Status: Connected')
        connected = is_connected
		self:update_icon(is_connected)
        info:update_info(status:sub(13))
        toggle_connect:update_info(is_connected)
	end, vpn_widget)

    vpn_widget:connect_signal("button::press", function(_, _, _, button)
        if (button == 1) then
            popup.visible = not popup.visible
        end
    end)

    




	

	return vpn_widget
end





return worker

