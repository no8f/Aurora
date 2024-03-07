<div align="center">
  <img height="150" src="https://www.marthastewart.com/thmb/ts80O6Fy1XyD66-QKjM9AweAh4o=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/perfect-white-rice-7-ef73aef3b89c42008d409441071502fb.jpg"  />
</div>

###

<div align="center">
</div>

###

<h1 align="center">Hyprland/Arch Dotfiles</h1>

###

>[!Note]
>This Rice is intended for personal use. It is currently at a very early stage of development. Use it only when you know what you're doing.

###

<h2 align="left">Needed Software</h2>

###

- Hyprland  > v0.36
- Rofi (wayland fork)
- Hyprlock
- Hypridle
- Elkowars weacky widgets
- Swww
- Kitty
- SDDM
- Firefox
- Kvantum
- qt6ct/qt5ct
- Network Manager
- Swaync
- FiraCode Nerd Font
- Better Discord (optional)
- Amixer
- Brightnessctl

###


###

<h2 align="left">Installation</h2>

###

Working on Automated installation... Currently you can just copy the folders :)

Clone this repo in a appropiate directory (maybe make a speperate directory for clones)
```
git clone https://github.com/no8f/Aurora.git
```

1. Copy the Wallpaper folder in your 'Pictures' directory
2. Copy the contents of .config/sddm folder in the /usr/share/sddm/themes directory, and edit the /etc/sddm.conf file to include: <br>

```
[Theme]
Current=sugar-candy
```

>[!Note]
>Please check if you have all dependecies for the theme

3. Copy the chrome folder from .config/firefoxcss in the $HOME/.mozilla/firefox/<some-mane>.default-release/ directory and activate firefox userChrome.css
4. Copy the Rest of the .config folder in your own .config directory
5. Open kvantum and install the folder .config/kvantum/MonochromeSolid. (it's a modiefied theme to work well with the rest of the desktop.)<br>
6. In the qt6ct/qt5ct change the style to kvantum.
7. For the GTK Theme you can use whatever you want (I use Andromeda), install it with nwg-looks.
8. Reboot.

###

<h2 align="left">Config Files</h2>

###
>[!Warning]
>The dotfiles are a mess :D.<br>Don't expect too much, I don't have much time.<br>Ah and some things don't work.

- The startup apps are located in .config/globalscripts/start.sh You can just append your own.
- The keybindings to open apps are in .config/hypr/hyprland.conf
>[!Note]
>To launch a app press WIN+R to open rofi or just press WIN key to open the side panel where some favorite apps are located.
- To add a new Wallpaper put a .png in Pictures/Wallpapers and in the side panel press the image icon to cicle through the Wallpapers.  


## Showcase Section
-
	![](.config/assets/1.png)
     	![](.config/assets/2.png)
    	![](.config/assets/3.png)

###

<h3>FAQ</h3>

<p>F: Why is it called Aurora</p>
<p>A: Starfield drug (don't ask)</p>
