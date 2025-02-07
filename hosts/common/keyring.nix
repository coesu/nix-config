{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    keyring.enable = lib.mkEnableOption "enable keyring";
  };

  config = lib.mkIf config.keyring.enable {
    security.polkit.enable = true;
    services.gnome.gnome-keyring.enable = true;
    security.pam.services.greetd.enableGnomeKeyring = true;
  };
}
