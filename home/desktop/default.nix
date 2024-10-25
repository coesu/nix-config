{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./anyrun.nix
    ./gtk.nix
    ./hypridle.nix
    # ./hyprland.nix
    ./hyprlock.nix
    inputs.anyrun.homeManagerModules.default
    ./packages.nix
    ./scripts.nix
    ./wlogout.nix
    ./xdg.nix
  ];

  # home.file.".config/sway" = {
  #   enable = true;
  #   source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-config/home/desktop/sway";
  #   recursive = true;
  # };
  home.file.".config/hypr" = {
    enable = true;
    recursive = true;
    source = ./hypr;
  };
  # home.file.".config/hypr/hyprpaper.conf".enable = false;
  home.file.".config/wofi" = {
    enable = true;
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-config/home/desktop/wofi";
    recursive = true;
  };
  home.file.".config/waybar/config" = {
    enable = true;
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-config/home/desktop/waybar/config";
  };
  home.file.".config/sioyek" = {
    enable = true;
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-config/home/desktop/sioyek";
    recursive = true;
  };
  home.file.".config/swappy" = {
    enable = true;
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-config/home/desktop/swappy";
    recursive = true;
  };

  programs = {
    alacritty = {
      enable = true;
      settings = {
        env.TERM = "xterm-256color";
        keyboard.bindings = [
          {
            key = "I";
            mods = "Control";
            chars = "\\u0015";
          }
        ];
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

  services = {
    mako = {
      enable = true;
      defaultTimeout = 5000;
    };
    network-manager-applet.enable = true;
    blueman-applet.enable = true;
  };
}
