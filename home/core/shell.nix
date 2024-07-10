{
  config,
  pkgs,
  inputs,
  ...
}: let
  aliases = {
    ls = "eza";
    l = "eza -l";
    la = "eza -la";
    lt = "eza -T";
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

  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = aliases;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    fileWidgetCommand = "fd --type f";
    changeDirWidgetCommand = "fd --type d";
    tmux.enableShellIntegration = true;
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    settings = {
      add_newline = false;
      nix_shell = {
        format = "via [$symbol]($style)";
      };
    };
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true; # see note on other shells below
    enableBashIntegration = true; # see note on other shells below
    nix-direnv.enable = true;
  };
}
