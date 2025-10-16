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

  virtualisation.podman.enable = true;
  virtualisation.podman.defaultNetwork.settings.dns_enabled = true;

  virtualisation.docker.enable = true;

  environment.systemPackages = with pkgs; [
    # Container runtime
    podman

    # Kubernetes tools
    kubectl
    minikube
    k3s
  ];

  services.k3s = {enable = true; role = "server"; token="super-secret"; };
  networking.firewall.allowedTCPPorts = [ 6443 80 443 ];
  networking.firewall.allowedUDPPorts = [ 8472 ];

  essentials.enable = true;
  user-lars.enable = true;
  nix-settings.enable = true;
  packages-option.enable = true;
  ssh.enable = true;
  ollamacuda.enable = true;
  stylix-option.enable = true;

  system.stateVersion = "24.11"; # Did you read the comment?
}
