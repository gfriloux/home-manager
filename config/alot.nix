{ pkgs, config, callPackage, ... }:

{
  programs = {
    alot = {
      enable = true;
    };
    himalaya.enable = true;
  };
}
