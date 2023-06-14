{ pkgs, config, callPackage, ... }:

let mod = "Mod4"; 
in {
  home.packages = with pkgs; [
    rofi
    polybar
    scrot       # Take screenshot for i3lock
    #i3lock
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
        { notification = false; command = "xautolock -time 10 -detectsleep -locker ~/.config/i3/lock.sh"; }
        { notification = false; command = "nm-applet"; }
        { notification = false; command = "picom --config ~/.config/picom/picom.conf"; }
        { notification = false; command = "~/.config/polybar/launch.sh"; }
        { notification = false; command = "flameshot"; }
      ];
      keybindings = pkgs.lib.mkOptionDefault {
        "${mod}+Return" = "exec nixGL alacritty";
        "${mod}+l" = "exec ~/.config/i3/lock.sh";
        "${mod}+Shift+q" = "kill";
        "${mod}+d" = "exec fish -c 'rofi -show drun -theme ~/.config/rofi/launchers/type-7/style-1.rasi'";
      };
      bars = [];
      colors = {
        focused = {
          border      = "#6272A4";
          background  = "#6272A4";
          text        = "#F8F8F2";
          indicator   = "#6272A4";
          childBorder = "#6272A4";
        };
        focusedInactive = {
          border      = "#44475A";
          background  = "#44475A";
          text        = "#F8F8F2";
          indicator   = "#44475A";
          childBorder = "#44475A";
        };
        unfocused = {
          border      = "#282A36";
          background  = "#282A36";
          text        = "#BFBFBF";
          indicator   = "#282A36";
          childBorder = "#282A36";
        };
        urgent = {
          border      = "#44475A";
          background  = "#FF5555";
          text        = "#F8F8F2";
          indicator   = "#FF5555";
          childBorder = "#FF5555";
        };
        placeholder = {
          border      = "#282A36";
          background  = "#282A36";
          text        = "#F8F8F2";
          indicator   = "#282A36";
          childBorder = "#282A36";
        };
        background    = "#F8F8F2";
      };
    };
  };

  home.file.".config/i3/lock.sh".source = ../files/i3/lock.sh;
  home.file.".config/i3/lock/Jotaro.Frozen.png".source = ../files/i3/Jotaro.Frozen.png;
  home.file.".config/i3/lock/new_za_warudo.mp4".source = ../files/i3/new_za_warudo.mp4;
}
