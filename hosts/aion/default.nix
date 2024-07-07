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

  virtualisation.docker.enable = true;

  services.ollama = {
    enable = true;
    acceleration = "rocm";
    environmentVariables = {
      # ROC_ENABLE_PRE_VEGA = "1";
      HCC_AMDGPU_TARGET = "gfx1030";
      # HSA_OVERRIDE_GFX_VERSION = "10.3.0";
    };
    rocmOverrideGfx = "10.3.0";
  };
}
