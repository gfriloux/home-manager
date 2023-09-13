{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./user.nix
    ./packages.nix
    ./config/fish.nix
    ./config/alacritty.nix
    ./config/i3.nix
  ];

  home.stateVersion = "23.05"; # Please read the comment before changing.
  home.keyboard = {
    layout = "fr";
  };

  fonts.fontconfig.enable = true;
  home.sessionVariables = {
    EDITOR = "micro";
    MICRO_TRUECOLOR=1;
    VISUAL="micro";
  };

  home.language = {
  	base = "fr_FR.UTF-8";
  };

  home.file.".mailcap".source = files/mailcap;

  targets.genericLinux.enable=true;

  gtk = {
    enable = true;

    font = {
      name    = "Iosevka 8";
      package = pkgs.iosevka;
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    theme = {
      name = "Dracula";
      package = pkgs.dracula-theme;
    };

    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };

  systemd.user.targets.tray = {
    Unit = {
      Description = "Home Manager System Tray";
      Requires = [ "graphical-session-pre.target" ];
    };
  };

  xdg = {
    enable = true;
    mimeApps = {
      enable = true;
      defaultApplications = {
        "text/plain" = "micro.desktop";
        "application/pdf" = "mupdf.desktop";
        "image/*" = "feh.desktop";
        "video/*" = "mpv.desktop";
        "audio/*" = "vlc.desktop";
        "text/html" = "firefox.desktop";
        "x-scheme-handler/http" = "firefox.desktop";
        "x-scheme-handler/https" = "firefox.desktop";
        "x-scheme-handler/ftp" = "firefox.desktop";
        "x-scheme-handler/chrome" = "firefox.desktop";
        "x-scheme-handler/about" = "firefox.desktop";
        "x-scheme-handler/unknown" = "firefox.desktop";
        "application/x-extension-htm" = "firefox.desktop";
        "application/x-extension-html" = "firefox.desktop";
        "application/x-extension-shtml" = "firefox.desktop";
        "application/xhtml+xml" = "firefox.desktop";
        "application/x-extension-xhtml" = "firefox.desktop";
        "application/x-extension-xht" = "firefox.desktop";
      };
    };
  };

  services = {
  	#ssh-agent.enable = true;
  	#polybar.enable = true;
#  	stalonetray.enable = true;
  	parcellite.enable = true;
  	opensnitch-ui.enable = true;
  	nextcloud-client.enable = true;
  	network-manager-applet.enable = true;
  	gpg-agent.enable = true;
  	flameshot.enable = true;
  };

  programs = {
    home-manager.enable = true;
    direnv.enable = true;
    alot = {
      enable = true;
      settings =  {
      	initial_command = "search tag:unread";
      };
    };

    bat = {
      enable = true;
      config = {
        theme = "Dracula";
        italic-text = "always";
      };
    };
  };
}
