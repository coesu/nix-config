{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  options = {
    packages-option.enable = lib.mkEnableOption "enable packages-option";
  };

  config = lib.mkIf config.packages-option.enable {
    environment.systemPackages = with pkgs; [
      vim
      nushell
      hyprpolkitagent
      ffmpeg
      imagemagick
      neovim
      git
      networkmanagerapplet
      networkmanager-openconnect
      openconnect
      tmux
      gcc
      ripgrep
      tldr
      gparted
      nix-output-monitor
      nvd
      gnumake
      inputs.zen-browser.packages."${system}".specific
      devenv
    ];

    environment.variables.EDITOR = "nvim";
    environment.pathsToLink = ["/share/zsh"];
  };
}
