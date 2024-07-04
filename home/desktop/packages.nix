{
  pkgs,
  config,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    zathura
    thunderbird
    nextcloud-client

    chromium
    firefox
    discord-screenaudio
    signal-desktop

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
