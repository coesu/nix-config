{
  pkgs,
  config,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    thunderbird

    chromium
    discord-screenaudio
    signal-desktop
    whatsapp-for-linux
    mattermost-desktop
    obsidian
    neovide
    nextcloud-client
    anki-bin
    texliveFull
    gimp

    oath-toolkit

    hypridle
    hyprpaper
    hyprlock
    hyprpicker
    hyprpolkitagent

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
    skim
    xdragon

    zotero

    ausweisapp
    qalculate-gtk
  ];
}
