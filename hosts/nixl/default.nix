{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../configuration.nix
    ./sddm.nix
    ./hardware-configuration.nix
  ];
  networking.hostName = "nixl";
}
