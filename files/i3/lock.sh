#!/usr/bin/env fish
set BG    "/tmp/lock.png"
set ICON  "$HOME/.config/i3/lock/Jotaro.Frozen.png"
set VIDEO "$HOME/.config/i3/lock/new_za_warudo.mp4"

if pgrep i3lock
  exit 0
end

rm -f "$BG"

scrot "$BG"
convert "$BG" -scale 10% -scale 1000% "$BG"
convert "$BG" "$ICON" -gravity center -composite -matte "$BG"
mpv --fs "$VIDEO"
i3lock -i "$BG"
