{
  config,
  inputs,
  pkgs,
  lib,
  ...
}: {
  nixpkgs.overlays = [
    inputs.hyprpanel.overlay
  ];
}
