{ pkgs, config, callPackage, ... }:
{

  programs = {
    alacritty = {
      enable = true;
    };
  };

  home.file.".config/alacritty/alacritty.yml".source = ../files/alacritty.yml;
}
