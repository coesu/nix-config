{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    steam.enable = lib.mkEnableOption "enable steam";
  };

  config = lib.mkIf config.steam.enable {
    programs.steam.enable = true;
    programs.steam.gamescopeSession.enable = true;
    programs.gamemode.enable = true;
    # environment.systemPackages = with pkgs; [protonup];
    environment.sessionVariables = {
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
      NIXOS_OZONE_WL = "1";
    };

    environment.systemPackages = with pkgs; [
      protonup
    ];
  };
}
