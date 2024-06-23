{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../configuration.nix
    ./greetd.nix
    ./hardware-configuration.nix
  ];
  networking.hostName = "aion";

  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;
  environment.systemPackages = with pkgs; [protonup];
  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
  };
}
