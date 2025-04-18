{
  config,
  inputs,
  lib,
  pkgs,
  outputs,
  ...
}: {
  imports = [
    ./desktop
    ./browser
    ./core
  ];
  home.username = "lars";
  home.homeDirectory = "/home/lars";
  stylix.targets.nushell.enable = false;

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
