local wibox = require("wibox")
local awful = require("awful")
local watch = require("awful.widget.watch")

local path_icons = "/home/rmx/.config/awesome/"

function crypto_image(pair)
	object  = wibox.widget{
		{
			id = pair,
			image = path_icons .. string.sub(pair,1,3) ..".png",
			resize = false,
			widget = wibox.widget.imagebox,
		},
		layout = wibox.container.margin(_,_,_,3),
		set_image = function(self,path)
			self.icon.image = path
		end
	}
	return object
end

function cryptowidget(pair)
	object = watch('python /home/rmx/.config/awesome/getprice.py -p '..pair,10,
			function(widget,stdout,stderr,exitreason,exitcode)
				widget:set_text(stdout)
			end
	)
	return object 
end

