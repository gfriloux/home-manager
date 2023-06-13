{ pkgs, config, callPackage, ... }:

let mod = "Mod4"; 
in {
  home.packages = with pkgs; [
    rofi
    polybar
    i3lock
    mpv         # For my i3lock script
    imagemagick # To create background for i3lock
    xautolock
    picom
    flameshot
  ];
  xsession.windowManager.i3 = {
    enable = true;
    config = rec {
      modifier = "Mod4";
      fonts = ["pango:DejaVu Sans Mono 8"];
      startup = [
        { notification = false; command = "xautolock -time 10 -detectsleep -locker /home/user/.config/i3/lock.sh"; }
        { notification = false; command = "nm-applet"; }
        { notification = false; command = "picom --config ~/.config/picom/picom.conf"; }
        { notification = false; command = "/home/user/.config/polybar/launch.sh"; }
        { notification = false; command = "flameshot"; }
      ];
      keybindings = pkgs.lib.mkOptionDefault {
        "${mod}+Return" = "exec nixGL alacritty";
        "${mod}+l" = "exec /home/user/.config/i3/lock.sh";
        "${mod}+Shift+q" = "kill";
        "${mod}+d" = "exec fish -c 'rofi -show drun -theme /home/user/.config/rofi/launchers/type-7/style-1.rasi'";
      };
      bars = [];
    };
  };
}
