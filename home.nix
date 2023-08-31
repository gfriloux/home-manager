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

  xdg.mime.enable = true;
  xdg.enable=true;
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
