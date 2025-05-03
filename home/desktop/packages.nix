{
  pkgs,
  config,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    thunderbird

    pyright

    libreoffice
    chromium
    discord
    signal-desktop
    whatsapp-for-linux
    mattermost-desktop
    obsidian
    neovide
    nextcloud-client
    anki-bin
    texliveFull
    gimp

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
    pavucontrol
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
