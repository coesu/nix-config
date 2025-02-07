{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    greetd.enable = lib.mkEnableOption "enable greetd";
  };

  config = lib.mkIf config.greetd.enable {
    services.greetd = {
      enable = true;
      settings = rec {
        initial_session = {
          command = "${pkgs.hyprland}/bin/Hyprland";
          user = "lars";
        };
        default_session = initial_session;
      };
    };
  };
}
