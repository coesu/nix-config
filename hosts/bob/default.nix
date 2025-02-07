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
  ssh.enable = true;
  ollama-cuda.enable = true;

  system.stateVersion = "24.11"; # Did you read the comment?
}
