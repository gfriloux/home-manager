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

  services = {
  	imapnotify.enable = true;
  };

  programs = {
    home-manager.enable = true;
    direnv.enable = true;
    himalaya.enable = true;
    alot = {
      enable = true;
      settings =  {
      	initial_command = "search tag:unread";
      };
    };
    notmuch = {
      enable = true;
      hooks = {
        postNew = ''
          notmuch tag +inbox +unread -new -- tag:new
          notmuch tag -new -unread +sent -- from:guillaume@friloux.me
          notmuch tag +achats -new -unread -killed -- 'from:service@paypal.fr' or 'subject:Votre commande sur LDLC' or 'subject:Votre commande Amazon.fr.*'
          notmuch tag +frsag -new -unread -- 'to:frsag@frsag.org'
          notmuch tag +dmarc -new -unread -inbox -- 'subject:.*Report Domain: friloux.me.*'
          notmuch tag +smashingmagazine +ml -new -unread -inbox -- 'from:newsletter@smashingmagazine.com'
          notmuch tag +EGIT +ml -new -unread -inbox -- 'to:git@lists.enlightenment.org'
          notmuch tag +softwarelead +ml -new -unread -inbox -- 'to:guillaume+softwareleadweekly@friloux.me'
          notmuch tag +killed -inbox -new -unread -- 'from:cws-noreply@google.com'            \
                                                  or 'from:bugzilla-noreply@freebsd.org'      \
                                                  or 'from:fulldisclosure@seclists.org'       \
                                                  or 'from:contact@mailer.humblebundle.com'   \
                                                  or 'from:info@news.ovhcloud.com'            \
                                                  or 'from:hello@molotov.tv'                  \
                                                  or 'from:contact@mail-agilauto-ca.fr'       \
                                                  or 'from:no-reply@primevideo.com'           \
                                                  or 'to:guillaume+ollygan@friloux.me'        \
                                                  or 'to:oss-security@lists.openwall.com'     \
                                                  or 'from:developer@insideapple.apple.com'   \
                                                  or 'from:opel@contactopel.com'              \
                                                  or 'from:administration@conservatoire40.fr' \
                                                  or 'from:ptm@conservatoire40.fr'            \
                                                  or 'from:noreply-maps-timeline@google.com'  \
                                                  or 'from:newsletter@elements.scaleway.com'  \
                                                  or 'from:notifications@educartable.com'     \
                                                  or 'from:tooketspg@ca-pyrenees-gascogne.fr' \
                                                  or 'from:paypal@mail.paypal.frpaypal@mail.paypal.fr'
        '';
      };
    };
    msmtp.enable = true;
    offlineimap.enable = true;
    bat = {
      enable = true;
      config = {
        theme = "Dracula";
        italic-text = "always";
      };
    };
  };
}
