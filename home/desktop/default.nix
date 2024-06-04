{ config, pkgs, ... }: {

  imports = [ ./packages.nix ./gtk.nix ./xdg.nix ];

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
  home.file.".config/zathura" = {
    enable = true;
    source = ./zathura;
    recursive = true;
  };

  programs.alacritty = {
    enable = true;
    settings = { env.TERM = "xterm-256color"; };
  };
  programs.foot.enable = true;

  programs.waybar.enable = true;
  wayland.windowManager.sway.enable = true;

  services = {

    mako = {
      enable = true;
      defaultTimeout = 5000;
    };
    # Keyring
    gnome-keyring = { enable = true; };

    # Applets, shown in tray
    # Networking
    network-manager-applet.enable = true;

    # Bluetooth
    blueman-applet.enable = true;

  };

  #  systemd.user = {
  # services.nextcloud-autosync = {
  #   Unit = {
  # 	Description = "Auto sync Nextcloud";
  # 	After = "network-online.target";
  #   };
  #   Service = {
  # 	Type = "simple";
  # 	ExecStart= "${pkgs.nextcloud-client}/bin/nextcloudcmd -h -n --path / /home/lars/Nextcloud https://nextcloud.larshumpert.com";
  # 	TimeoutStopSec = "180";
  # 	KillMode = "process";
  # 	KillSignal = "SIGINT";
  #   };
  #   Install.WantedBy = ["multi-user.target"];
  # };
  # timers.nextcloud-autosync = {
  #   Unit.Description = "Automatic sync files with Nextcloud when booted up after 5 minutes then rerun every 60 minutes";
  #   Timer.OnBootSec = "5min";
  #   Timer.OnUnitActiveSec = "30min";
  #   Install.WantedBy = ["multi-user.target" "timers.target"];
  # };
  # startServices = true;
  #  };
}
