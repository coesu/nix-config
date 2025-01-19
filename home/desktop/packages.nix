{
  pkgs,
  config,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    thunderbird

    pyright

    onlyoffice-bin
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

    julia

    ausweisapp
    qalculate-gtk
  ];
}
