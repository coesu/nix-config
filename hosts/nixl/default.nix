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
  networking.hostName = "nixl";

  virtualisation.docker.enable = true;

  desktop.enable = true;
  essentials.enable = true;
  greetd.enable = false;
  keyring.enable = true;
  user-lars.enable = true;
  nix-settings.enable = true;
  ollamarocm.enable = false;
  packages-option.enable = true;
  sddm.enable = true;
  sound-option.enable = true;
  ssh.enable = true;
  steam.enable = true;
  stylix-option.enable = true;

  system.stateVersion = "24.05";
}
