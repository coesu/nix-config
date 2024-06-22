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
}
