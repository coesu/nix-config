{
  config,
  pkgs,
  inputs,
  ...
}: let
  aliases = {
    la = "ls -a";
    l = "ls -l";
    cp = "cp -iv";
    mv = "mv -iv";
    rm = "rm -iv";

    svim = "sudoedit";
    vim = "nvim";
    vi = "nvim";

    t = "tmux";

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
      setopt extended_glob null_glob
      set -o vi
      bindkey '^o' autosuggest-execute
      bindkey -s '^n' "nvim +\"Telescope git_files cwd=.\"\n"
      bindkey -s '^f' "tmux-sessionizer\n"
      export PATH=$HOME/.local/scripts:$PATH
    '';
  };

  programs.nushell = {
    enable = true;
    shellAliases = aliases;
    extraConfig = ''
      $env.config = {
          show_banner: false
      }
    '';
  };
  programs.carapace = {
    enable = true;
    enableNushellIntegration = true;
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
    enableNushellIntegration = true;
    settings = {
      add_newline = false;
      nix_shell = {
        format = "via [$symbol]($style)";
      };
    };
  };

  programs.zoxide = {
    enable = true;
    enableNushellIntegration = true;
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    enableNushellIntegration = true;
    nix-direnv.enable = true;
  };
}
