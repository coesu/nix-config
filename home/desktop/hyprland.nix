{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = (builtins.readFile ./hypr/options.conf) + (builtins.readFile ./hypr/keybinds.conf) + (builtins.readFile ./hypr/startup.conf) + (builtins.readFile ./hypr/windowrules.conf);

    # extraConfig = ''
    #   source= ./startup.conf
    #   source= ./options.conf
    #   source= ./windowrules.conf
    #   source= ./keybinds.conf
    # '';
  };
}
