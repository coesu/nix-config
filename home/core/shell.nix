{ config, pkgs, inputs, ... }:
let
  aliases = {
    ls = "eza";
    l = "eza -l";
    la = "eza -la";
    f = "z";
    j = "zi";

    cp = "cp -iv";
    mv = "mv -iv";
    rm = "rm -iv";

    svim = "sudoedit";
    vim = "nvim";
    vi = "nvim";

    za = "zathura";

    ff = "fastfetch";
    ":q" = "exit";

    drag = "xdragon -a -x";

    update = "sudo nixos-rebuild switch --flake /home/lars/nix-config";
  };
in {
  programs.zsh = {
    enable = true;
    autocd = true;
    dotDir = ".config/zsh";
    history = {
      path = "$HOME/.config/zsh/.histfile";
      save = 10000;
      size = 10000;
    };
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = aliases;

    initExtra = ''
      bindkey '^o' autosuggest-execute
      bindkey -s '^n' "nvim +\"Telescope git_files cwd=.\"\n"
      bindkey -s '^f' "tmux-sessionizer\n"
      export PATH=$HOME/.local/scripts:$PATH
    '';
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = { add_newline = false; };
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true; # see note on other shells below
    nix-direnv.enable = true;
  };

}
