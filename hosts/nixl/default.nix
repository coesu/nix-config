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
  # services.desktopManager.cosmic.enable = true;
  # services.displayManager.cosmic-greeter.enable = true;
}
