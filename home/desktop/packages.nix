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
    anki-bin
    texliveFull
    gimp

    hypridle
    hyprpaper
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

    lazygit
    ttyper
    du-dust
    helix

    ausweisapp
    qalculate-gtk
  ];
}
