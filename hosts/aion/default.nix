{
  lib,
  pkgs,
  config,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../common
  ];
  networking.hostName = "aion";

  virtualisation.docker.enable = true;

  desktop.enable = true;
  essentials.enable = true;
  greetd.enable = true;
  keyring.enable = true;
  user-lars.enable = true;
  nix-settings.enable = true;
  ollamarocm.enable = true;
  packages-option.enable = true;
  sddm.enable = false;
  sound-option.enable = true;
  ssh.enable = true;
  steam.enable = true;
  stylix-option.enable = true;

  system.stateVersion = "24.05";
}
