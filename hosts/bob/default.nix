{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../configuration.nix
    ./hardware-configuration.nix
  ];
  networking.hostName = "bob";

  virtualisation.docker.enable = true;


  # Add user to necessary groups
  users.users.lars = {
    extraGroups = ["video" "render"];
  };
}
