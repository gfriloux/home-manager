{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./packages.nix
    ./config/git.nix
    ./config/fish.nix
    ./config/i3.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "user";
  home.homeDirectory = "/home/user";

  home.stateVersion = "23.05"; # Please read the comment before changing.
  home.keyboard = {
    layout = "fr";
  };
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  fonts.fontconfig.enable = true;
  home.sessionVariables = {
    EDITOR = "nvim";
    MICRO_TRUECOLOR=1;
    VISUAL="micro";
    #LANG="fr_FR.UTF-8";
    #LC_ALL="fr_FR.UTF-8";
    #LANGUAGE="fr_FR.UTF-8";
    #LOCALE_ARCHIVE="$(nix-env --installed --no-name --out-path --query glibc-locales)/lib/locale/locale-archive";
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

  #home.file.".config/alacritty/alacritty.yml".source = ./files/alacritty.yml;

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
