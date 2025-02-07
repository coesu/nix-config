#
# greeter -> tuigreet https://github.com/apognu/tuigreet?tab=readme-ov-file
# display manager -> greetd https://man.sr.ht/~kennylevinsen/greetd/
#
{
  config,
  pkgs,
  lib,
  ...
}: {
  options = {
    sddm.enable = lib.mkEnableOption "enable sddm";
  };

  config = lib.mkIf config.sddm.enable {
    services.displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
        theme = "${import ./sddm-theme.nix {inherit pkgs;}}";
      };
      autoLogin.enable = true;
      autoLogin.user = "lars";
    };
    environment.systemPackages = with pkgs; [
      libsForQt5.qt5.qtquickcontrols2
      libsForQt5.qt5.qtgraphicaleffects
    ];
  };
}
