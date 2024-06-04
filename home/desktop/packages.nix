{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    tmux
    neovim
    eza

    zathura
    thunderbird
    nextcloud-client

    chromium
    firefox

    xfce.thunar
    xfce.thunar-volman
    waybar
    playerctl
    pamixer
    wofi
    wl-clipboard
    imv
    networkmanagerapplet
    swappy
    grim
    slurp
    xdragon
  ];
}
