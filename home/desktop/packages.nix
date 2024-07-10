{
  pkgs,
  config,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    thunderbird
    nextcloud-client

    chromium
    firefox
    discord-screenaudio
    signal-desktop
    obsidian
    neovide

    hypridle
    hyprlock
    hyprpaper
    hyprpicker

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
