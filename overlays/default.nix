{
  config,
  inputs,
  pkgs,
  lib,
  ...
}: {
  # nixpkgs.overlays = [
  #   inputs.hyprpanel.overlay."x86_64-linux"
  # ];
  nixpkgs.overlays = [
    (final: _: {
      # this allows you to access `pkgs.unstable` anywhere in your config
      stable = import inputs.nixpkgs-stable {
        inherit (final.stdenv.hostPlatform) system;
        inherit (final) config;
      };
    })
  ];
}
