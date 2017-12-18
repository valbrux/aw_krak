# aw_krak
Cryptocurrencies widget for Kraken platform working on awesome wm
# Result
![widget](widget.png?raw=true "Widget")
# Installation
Copy the files cryptowidget.lua and getprice.py in the directory ~/.config/awesome then add this line in the rc.lua file:
```local cryptowidget = require("cryptowidget")```    
Copy the images (LTC.png and XRP.png) in the same directory and edit the file cryptowidget.lua according to your environment:
```local path_icons = "/home/[YOUR_HOME_DIRECTORY]/.config/awesome/"```     
```object = watch('python /home/[YOUR_HOME_DIRECTORY]/.config/awesome/getprice.py -p '..pair,10, ```   
To create a widget for a particular currency you just have to call the function cryptowidget() with the pair as argument. Example:
```
-- Crypto widgets 
ltceur = cryptowidget('LTCEUR')
xrpeur = cryptowidget('XRPEUR')
```
To create the related icon, you just have to put the icon(png format) in the path_icons folder and rename it with the cryptocurrency name. Then you can use the cryptoimage() function. Example:
```
ltceur_icon = crypto_image('LTCEUR')
xrpeur_icon = crypto_image('XRPEUR')
```
And then add the widgets to your favourite wibox:
```
  s.mywibox2:setup{
	layout = wibox.layout.align.horizontal,
	{ -- Left widgets
	     layout = wibox.layout.fixed.horizontal,
	},
	{
	     layout = wibox.layout.fixed.horizontal,
	},
	{
	  -- Right widgets
	     layout = wibox.layout.fixed.horizontal,
	     xrpeur_icon,
	     xrpeur,
	     ltceur_icon,
	     ltceur,
	},
    }
```


