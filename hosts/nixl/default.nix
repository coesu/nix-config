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

  services.ollama = {
    enable = true;
    package = pkgs.stable.ollama;
  };
  # power management for laptop
  services.tlp.enable = true;
  # services.desktopManager.cosmic.enable = true;
  # services.displayManager.cosmic-greeter.enable = true;
}
