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

    initContent = ''
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
      $env.PATH = ($env.PATH | split row (char esep) | append ($env.HOME | path join .local scripts))
      $env.PATH = ($env.PATH | split row (char esep) | append ($env.HOME | path join .cargo bin))
      $env.PATH = ($env.PATH | split row (char esep) | append "/opt/rocm/bin")
      let anthropic_api = (open "/home/lars/anthropic-api" | str trim)
      $env.ANTHROPIC_API_KEY = $anthropic_api
      $env.GEMINI_API_KEY = (open "/home/lars/gemini-api" | str trim)
      $env.OPENAI_API_KEY = (open "/home/lars/openai-api" | str trim)
      $env.config = {
          show_banner: false
          rm: { always_trash: true }
          edit_mode: vi
          keybindings: [
            {
                name: complete_history_hint
                modifier: CONTROL
                keycode: Char_o
                mode: vi_insert
                event:[
                  { send: HistoryHintComplete }
                  { send: Enter }
                  ]
            }
            {
                name: change_dir_with_fzf
                modifier: ALT
                keycode: Char_c
                mode: vi_insert
                event:[
                  {
                    edit: InsertString,
                    value: "cd (fd -t d | sk)"
                  }
                  { send: Enter }
                  ]
            }
            {
                name: select_file_with_fzf
                modifier: CONTROL
                keycode: Char_t
                mode: vi_insert
                event:[
                  { edit: InsertString,
                    value: "(fd -t f | sk)"

                  }
                  { send: Enter }
                  ]
            }
            {
                name: open_file_nvim_sk
                modifier: CONTROL
                keycode: Char_e
                mode: vi_insert
                event:[
                  # { edit: Clear }
                  { edit: InsertString,
                    value: "nvim (fd -t f | sk)"
                  }
                  { send: Enter }
                  ]
            }
            {
                name: tmux-sessionizer
                modifier: CONTROL
                keycode: Char_f
                mode: vi_insert
                event:[
                  # { edit: Clear }
                  { edit: InsertString,
                    value: "tmux-sessionizer"
                  }
                  { send: Enter }
                  ]
            }
          ]


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

  programs.skim.enable = true;

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
