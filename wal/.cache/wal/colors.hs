--Place this file in your .xmonad/lib directory and import module Colors into .xmonad/xmonad.hs config
--The easy way is to create a soft link from this file to the file in .xmonad/lib using ln -s
--Then recompile and restart xmonad.

module Colors
    ( wallpaper
    , background, foreground, cursor
    , color0, color1, color2, color3, color4, color5, color6, color7
    , color8, color9, color10, color11, color12, color13, color14, color15
    ) where

-- Shell variables
-- Generated by 'wal'
wallpaper="/usr/share/backgrounds/wallpapers/g7o9jl.png"

-- Special
background="#1b1a1c"
foreground="#bab4b7"
cursor="#bab4b7"

-- Colors
color0="#1b1a1c"
color1="#505369"
color2="#6D6977"
color3="#92513E"
color4="#9A7263"
color5="#9C8177"
color6="#757282"
color7="#bab4b7"
color8="#827d80"
color9="#505369"
color10="#6D6977"
color11="#92513E"
color12="#9A7263"
color13="#9C8177"
color14="#757282"
color15="#bab4b7"
