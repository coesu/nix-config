# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    # ./greetd.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Berlin";

  i18n.defaultLocale = "en_US.UTF-8";

  security.polkit.enable = true;

  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;
  # environment.systemPackages = with pkgs; [protonup];
  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
  };

  programs.zsh.enable = true;

  programs.sway.enable = true;
  # services.xserver.windowManager.qtile = {
  #   enable = true;
  #   extraPackages = python3Packages:
  #     with python3Packages; [
  #       qtile-extras
  #     ];
  # };
  programs.hyprland = {
    enable = true;
  };
  programs.sway.wrapperFeatures.gtk = true;

  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-wlr
        xdg-desktop-portal-gtk
      ];
    };
  };

  services.gvfs.enable = true;

  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [thunar-archive-plugin thunar-volman];
  };

  stylix = {
    enable = true;
    image = ./../home/gruv-estimate.jpg;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";

    cursor.package = pkgs.bibata-cursors;
    cursor.name = "Bibata-Modern-Ice";
    cursor.size = 24;

    fonts = {
      monospace = {
        package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
        name = "JetBrainsMono Nerd Font Mono";
      };
      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };
    };
    fonts.sizes = {
      applications = 12;
      terminal = 13;
      desktop = 12;
      popups = 12;
    };
    polarity = "dark";
  };

  # Enable sound.
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
    jack.enable = true;
  };
  services.jack.alsa.enable = true;

  hardware.keyboard.qmk.enable = true;
  hardware.graphics = {
    enable = true;
  };
  services.xserver.videoDrivers = ["amdgpu"];

  services.syncthing = {
    enable = true;
    user = "lars";
    dataDir = "/home/lars/Sync";
  };

  programs.nix-ld.enable = true;

  programs.nh.enable = true;

  users.users.lars = {
    isNormalUser = true;
    initialPassword = "123";
    extraGroups = [
      "wheel"
      "networkmanager"
      "docker"
    ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      tree
      zsh
      alacritty
      qmk
    ];
  };

  environment.systemPackages = with pkgs; [
    protonup
    vim
    ffmpeg
    imagemagick
    neovim
    git
    networkmanagerapplet
    networkmanager-openconnect
    openconnect
    tmux
    gcc
    ripgrep
    clang
    pavucontrol
    tldr
    gparted
    nix-output-monitor
    nvd
    lxqt.lxqt-policykit
  ];
  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nixpkgs.config.allowUnfree = true;
  environment.variables.EDITOR = "nvim";
  environment.pathsToLink = ["/share/zsh"];

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  services.openssh.enable = true;

  system.stateVersion = "24.05";
}
