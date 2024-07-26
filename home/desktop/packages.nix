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
    whatsapp-for-linux
    mattermost-desktop
    obsidian
    neovide
    anki-bin

    hyprpaper
    hypridle
    hyprlock
    hyprpicker

    lm_sensors
    sassc

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
