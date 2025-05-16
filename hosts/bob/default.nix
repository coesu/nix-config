{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../common
    ./hardware-configuration.nix
  ];
  networking.hostName = "bob";

  virtualisation.docker.enable = true;

  essentials.enable = true;
  user-lars.enable = true;
  nix-settings.enable = true;
  packages-option.enable = true;
  ssh.enable = true;
  ollamacuda.enable = true;
  stylix-option.enable = true;

  system.stateVersion = "24.11"; # Did you read the comment?
}
