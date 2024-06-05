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
    discord-screenaudio

    waybar
    playerctl
    pamixer
    wofi
    wl-clipboard
    imv
    mpv
    networkmanagerapplet
    swappy
    grim
    slurp
    xdragon
  ];
}
