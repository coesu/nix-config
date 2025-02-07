{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    essentials.enable = lib.mkEnableOption "enable essentials";
  };

  config = lib.mkIf config.essentials.enable {
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    networking.networkmanager.enable = true;

    time.timeZone = "Europe/Berlin";

    i18n.defaultLocale = "en_US.UTF-8";

    programs.nix-ld.enable = true;

    programs.nh.enable = true;
  };
}
