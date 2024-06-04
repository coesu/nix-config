{ config, lib, pkgs, outputs, ... }: {
  imports = [ ./bat.nix ./git.nix ./shell.nix ./zoxide.nix ];

  home.file.".tmux.conf" = {
    enable = true;
    source = ./tmux.conf;
  };

  home.packages = with pkgs; [ vifm nnn tldr btop fd ];

}
