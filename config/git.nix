{ pkgs, ... }: {
  programs.git = {
    enable = true;
    userName = "Guillaume Friloux";
    userEmail = "guillaume@friloux.me";

    signing = {
      key = "4DF35290882C2927ACD88A4F6FCA9BE19FC69E48";
      signByDefault = true;
    };

    delta = {
      enable = true;
    };
  };
}
