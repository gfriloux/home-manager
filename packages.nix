{ pkgs, ... }: {
  home.packages = with pkgs; [
    ripgrep
    fzf
    yubikey-manager
    tmux
    topgrade
    gnome.vinagre
    rbw
    tldr
    pwgen
    rsync
    peek
    mupdf
    glow
    slack
    vlc
    ncdu
    croc
    neovim
    micro
    ueberzug
    just
    feh
    jq
    neomutt
    firefox
    oh-my-posh
    lxappearance
    dconf
    gnome3.dconf-editor
    gtk_engines
    glibcLocales
    imagemagick
  ];
}
