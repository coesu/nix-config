{
  config,
  lib,
  pkgs,
  outputs,
  ...
}: {
  imports = [
    ./bat.nix
    ./git.nix
    ./shell.nix
    ./zoxide.nix
  ];

  home.file.".tmux.conf" = {
    enable = true;
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-config/home/core/tmux.conf";
    # source = ./tmux.conf;
  };

  home.file.".config/nvim" = {
    enable = true;
    recursive = true;
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-config/home/core/nvim";
    # source = ./nvim;
  };

  programs.btop.enable = true;
  home.packages = with pkgs; [
    #neovim stuff
    pyright
    rust-analyzer

    lua-language-server
    stylua
    ruff

    tldr
    fd
    tmux
    zellij
    lazygit
    ttyper
    du-dust
    helix

    lua51Packages.lua
    luajitPackages.luarocks
    tree-sitter
    killall
    fastfetch

    nodejs
    unzip
    zip
    alejandra
  ];
}
