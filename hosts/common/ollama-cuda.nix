{
  lib,
  pkgs,
  config,
  ...
}: {
  options = {
    ollamacuda.enable = lib.mkEnableOption "enables ollama with cuda";
  };

  config = lib.mkIf config.ollamacuda.enable {
    services.ollama = {
      enable = true;
      acceleration = "cuda";
    };
  };
}
