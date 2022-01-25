local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi


local icons = {
	"",
	"",
}

local systray = function (s)
	if s ~= screen.primary then return end
	local widget = wibox.widget{
		{
			{
				id = "systray",
				screen = s,
				base_size = dpi(20),
				widget = wibox.widget.systray,
				spacing = 20,
				visible = false
			},
			{
				{
				
					id = 'icon',
					widget = wibox.widget.textbox,
					markup = '',
					align  = 'center',
					valign = 'center',
					font = 'Font Awesome 5 Brands 14'
				},
				left = dpi(4),
				widget = wibox.container.margin
			},
			layout = wibox.layout.fixed.horizontal
		},
		top = dpi(4),
		right = dpi(8),
		widget = wibox.container.margin
	}

	

	local syswidget = widget:get_children_by_id('systray')[1]
	widget:get_children_by_id('icon')[1]:connect_signal("button::press", function(_, _, _, button)
        if (button == 1) then			
            syswidget.visible = not syswidget.visible
			widget:get_children_by_id('icon')[1].markup = icons[syswidget.visible and 1 or 2]
        end
    end)

	return widget
end

return systray