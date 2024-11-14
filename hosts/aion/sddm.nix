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
  services.displayManager = {
    sddm = {
      enable = true;
      wayland.enable = true;
      theme = "${import ../common/sddm-theme.nix {inherit pkgs;}}";
    };
    autoLogin.enable = true;
    autoLogin.user = "lars";
  };
  environment.systemPackages = with pkgs; [
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtgraphicaleffects
  ];
}
