{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./ags.nix
    ./anyrun.nix
    ./gtk.nix
    inputs.anyrun.homeManagerModules.default
    ./hypridle.nix
    ./hyprlock.nix
    ./packages.nix
    ./scripts.nix
    ./wlogout.nix
    ./xdg.nix
  ];

  home.file.".config/sway" = {
    enable = true;
    source = ./sway;
    recursive = true;
  };
  home.file.".config/hypr" = {
    enable = true;
    source = ./hypr;
    recursive = true;
  };
  home.file.".config/wofi" = {
    enable = true;
    source = ./wofi;
    recursive = true;
  };
  home.file.".config/waybar" = {
    enable = true;
    source = ./waybar;
    recursive = true;
  };
  home.file.".config/sioyek" = {
    enable = true;
    source = ./sioyek;
    recursive = true;
  };
  home.file.".config/swappy" = {
    enable = true;
    source = ./swappy;
    recursive = true;
  };

  programs = {
    alacritty = {
      enable = true;
      settings = {
        env.TERM = "xterm-256color";
      };
    };
    foot = {
      enable = true;
      settings = {
        text-bindings = {"\\x15" = "Control+i";};
      };
    };

    zathura.enable = true;
    sioyek.enable = true;
    yazi.enable = true;
    ncspot.enable = true;
    waybar.enable = true;
  };
  wayland.windowManager.sway.enable = true;
  wayland.windowManager.hyprland = {
    enable = true;
  };

  services = {
    mako = {
      enable = true;
      defaultTimeout = 5000;
    };
    # Keyring
    gnome-keyring = {
      enable = true;
    };
    nextcloud-client.enable = true;

    # Applets, shown in tray
    # Networking
    network-manager-applet.enable = true;

    # Bluetooth
    blueman-applet.enable = true;
  };
}
