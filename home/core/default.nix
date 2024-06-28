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
    source = ./tmux.conf;
  };

  home.file.".config/nvim" = {
    enable = true;
    recursive = true;
    source = ./nvim;
  };

  programs.btop.enable = true;
  home.packages = with pkgs; [
    tldr
    fd
    tmux
    neovim
    eza

    lua51Packages.lua
    luajitPackages.luarocks
    tree-sitter
    nodejs
    python3
    unzip
    zip
    # isort
    # python312Packages.jedi-language-server
    alejandra
    # lua-language-server
    # luajitPackages.jsregexp
    # ruff
    # stylua
  ];
}
