{
  config,
  inputs,
  pkgs,
  lib,
  ...
}: {
  nixpkgs.overlays = [inputs.hyprpanel.overlay."x86_64-linux"];
}
