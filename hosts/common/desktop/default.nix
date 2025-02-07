{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    desktop.enable = lib.mkEnableOption "enable desktop";
  };

  config = lib.mkIf config.desktop.enable {
    programs.hyprland = {
      enable = true;
      withUWSM = true;
    };

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

    services.printing.enable = true;
    services.avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };

    hardware.keyboard.qmk.enable = true;
    hardware.graphics = {
      enable = true;
    };
  };
}
