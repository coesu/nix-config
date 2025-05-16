{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./desktop
    ./essentials.nix
    ./greetd.nix
    ./keyring.nix
    ./lars.nix
    ./nix-settings.nix
    ./ollama-rocm.nix
    ./ollama-cuda.nix
    ./packages.nix
    ./sddm.nix
    ./sound.nix
    ./ssh.nix
    ./steam.nix
    ./stylix.nix
  ];
}
