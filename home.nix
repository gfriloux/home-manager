{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./user.nix
    ./packages.nix
    ./config/fish.nix
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
      name = "dracula";
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

  programs = {
    home-manager.enable = true;
    direnv.enable = true;
    bat = {
      enable = true;
      config = {
        theme = "Dracula";
        italic-text = "always";
      };
    };
    alacritty = {
      enable = true;
      settings = {
        font.size = 8;
      };
    };
  };
}
