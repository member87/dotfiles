local wibox = require("wibox")
local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi


-- calendar
local styles = {}

styles.month = {
	bg_color = "#00000000",
    border_width = 0,
}

styles.normal = {
	padding = dpi(6),
    fg_color = beautiful.fg_muted,
}

styles.focus = {
	fg_color = beautiful.fg_normal,
    markup   = function(t) return '<b>' .. t .. '</b>' end,
	bg_color = beautiful.bg_focus,
	padding = dpi(6),
	shape = gears.shape.circle
}

styles.header = {
	fg_color = beautiful.fg_normal,
	bg_color = "#00000000",
    markup = function(t) return '<span font="Ubuntu bold 12">' .. t .. '</span>' end,
	shape = beautiful.widget_shape
}

styles.weekday = {
	fg_color = beautiful.bg_normal_alt,
    markup = function(t) return string.upper(t) end,
}

local function decorate_cell(widget, flag, date)
	if flag=='monthheader' and not styles.monthheader then
		flag = 'header'
	end
	local props = styles[flag] or {}
	if props.markup and widget.get_text and widget.set_markup then
		widget:set_markup(props.markup(widget:get_text()))
	end
	-- Change bg color for weekends
	local d = {year=date.year, month=(date.month or 1), day=(date.day or 1)}
	local weekday = tonumber(os.date('%w', os.time(d)))
	local default_bg = (weekday==0 or weekday==7) and '#00000000' or '#00000000'
	local ret = wibox.widget {
		{
			widget,
			margins = (props.padding or 0) + (props.border_width or 0),
			widget  = wibox.container.margin
		},
		shape              = props.shape,
		shape_border_color = props.border_color or default_bg,
		shape_border_width = props.border_width or 0,
		fg                 = props.fg_color or beautiful.fg_normal,
		bg                 = props.bg_color or default_bg,
		widget             = wibox.container.background
	}
	return ret
end

local calendar = wibox.widget{
	date = os.date('*t'),
	font = beautiful.font,
	long_weekdays = false,
	start_sunday = false,
	fn_embed = decorate_cell,
	widget = wibox.widget.calendar.month
}


local button = function(icon) 
	local widget = wibox.widget{
        {
            widget = wibox.widget.textbox,
            text = icon,
            align  = 'center',
            valign = 'center',
            font = 'Font Awesome 5 Brands 16',
			forced_width = dpi(16),
			forced_height = dpi(16),
        },
		margins = dpi(2),
		widget = wibox.container.margin
	}
	
	local old_cursor, old_wibox

	widget:connect_signal("mouse::enter", function(c)
    	local wb = mouse.current_wibox
    	old_cursor, old_wibox = wb.cursor, wb
    	wb.cursor = "hand2"
	end)
	widget:connect_signal("mouse::leave", function(c)
    	if old_wibox then
        	old_wibox.cursor = old_cursor
        	old_wibox = nil
    	end
	end)

	return widget
end

local button_previous = button("")
local button_next = button("")


button_previous:buttons(
	gears.table.join(
		awful.button(
			{},
			1,
			function()
				local date = calendar:get_date()
            	date.month = date.month - 1
            	calendar:set_date(nil)
            	calendar:set_date(date)
			end
		)
	)
)

button_next:buttons(
	gears.table.join(
		awful.button(
			{},
			1,
			function()
				local date = calendar:get_date()
            	date.month = date.month + 1
            	calendar:set_date(nil)
            	calendar:set_date(date)
			end
		)
	)
)

local calendar_widget = wibox.widget {
	layout = wibox.layout.align.vertical,
	calendar,
	{
		{
			layout = wibox.layout.align.horizontal,
			expand = "inside",
			nil, 
			nil, 
			{
				layout = wibox.layout.fixed.horizontal,
				spacing = dpi(10),
				button_previous,
				button_next
			}
		},
		-- top = dpi(-10),
		widget = wibox.container.margin
	}
}

return calendar_widget