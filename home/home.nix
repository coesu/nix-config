{ config, pkgs, inputs, ... }:

let
    gruvboxplus = import ./gruvbox-plus.nix { inherit pkgs; };
in
{

  imports = [
	inputs.nix-colors.homeManagerModules.default
	./features/mako.nix
	./features/alacritty.nix
	./package-list.nix
  ];

  home.username = "lars";
  home.homeDirectory = "/home/lars";

  home.file.".config/hypr" = {
  	enable = true;
  	source = ./hypr;
	recursive = true;
  };
  home.file.".config/mako" = {
  	source = ./mako;
	recursive = true;
  };
  
  nixpkgs.config.allowUnfree = true;

  home.sessionVariables = {
	EDITOR = "nvim";
	TESTLSDFKJLSDFKJSDLFKJ = "YETS";
  };

  xdg.mimeApps = {
      enable = true;
      defaultApplications = {
          "application/pdf" = ["org.pwmt.zathura-pdf-mupdf.desktop"];
          "application/djvu" = ["org.pwmt.zathura-dfvu.desktop"];
      };
  };

  programs.git = {
	enable = true;
	userName = "Lars Humpert";
	userEmail = "larshumpert@gmx.net";
  };

  programs.firefox = {
    enable = true;
  };

  gtk = {
	enable = true;

	cursorTheme.package = pkgs.bibata-cursors;
	cursorTheme.name = "Bibata-Modern-Ice";

	theme.package = pkgs.adw-gtk3;
	theme.name = "adw-gtk3";
	
	iconTheme.package = pkgs.papirus-icon-theme;
	# iconTheme.package = pkgs.gruvbox-dark-icons-gtk;
	iconTheme.name = "Papirus-Dark";
  };

  qt = {
  	enable = true;
	platformTheme = "gtk";
	style.name = "adwaita-dark";

	style.package = pkgs.adwaita-qt;
  };

  programs.zsh = {
  	enable = true;
	autocd = true;
	dotDir = ".config/zsh";
	plugins = [
	{
		name = "zsh-autosuggestions";
		src = pkgs.fetchFromGitHub {
		  owner = "zsh-users";
		  repo = "zsh-autosuggestions";
		  rev = "v0.7.0";
		  hash = "sha256-KLUYpUu4DHRumQZ3w59m9aTW6TBKMCXl2UcKi4uMd7w";
		};
	}
	{
		name = "zsh-autopair";
		src = pkgs.fetchFromGitHub {
		  owner = "hlissner";
		  repo = "zsh-autopair";
		  rev = "34a8bca0c18fcf3ab1561caef9790abffc1d3d49";
		  sha256 = "1h0vm2dgrmb8i2pvsgis3lshc5b0ad846836m62y8h3rdb3zmpy1";
		};
		file = "autopair.zsh";
	}

	{
		name = "supercharge";
		src = pkgs.fetchFromGitHub {
		  owner = "zap-zsh";
		  repo = "supercharge";
		  rev = "e76f4e8";
		  hash = "sha256-6ygs7XcKaqxDhfXdEgEbVVSnlEMcACXjRX4JrLzPUJY";
		};
	}
	{
		name = "zsh-syntax-highlighting";
		src = pkgs.fetchFromGitHub {
		  owner = "zsh-users";
		  repo = "zsh-syntax-highlighting";
		  rev = "932e29a";
		  hash = "sha256-gOG0NLlaJfotJfs+SUhGgLTNOnGLjoqnUp54V9aFJg8";
		};
	}
	];
	shellAliases = {
		ls = "exa";
		l = "exa -l";
		la = "exa -la";
		f = "z";
		j = "zi";

		cp = "cp -iv";
		mv = "mv -iv";
		rm = "rm -iv";

		vim= "nvim";
		vi= "nvim";

		za = "zathura";

		ze = "zellij";

		drag = "xdragon -a -x";

		update = "sudo nixos-rebuild switch";
	};
  };

  programs.nushell = {
    enable = true;
	extraConfig = ''
use /home/lars/.config/nushell.bak/nu_scripts/custom-completions/git/git-completions.nu *
use /home/lars/.config/nushell.bak/nu_scripts/custom-completions/glow/glow-completions.nu *
use /home/lars/.config/nushell.bak/nu_scripts/custom-completions/make/make-completions.nu *
use /home/lars/.config/nushell.bak/nu_scripts/custom-completions/nix/nix-completions.nu *
use /home/lars/.config/nushell.bak/nu_scripts/custom-completions/man/man-completions.nu *
use /home/lars/.config/nushell.bak/nu_scripts/custom-completions/cargo/cargo-completions.nu *
use /home/lars/.config/nushell.bak/nu_scripts/custom-completions/zellij/zellij-completions.nu *

$env.config = {
	show_banner: false,
	edit_mode: vi_insert,
	keybindings: [
	{
	name: change_dir_with_fzf
	modifier: ALT
	keycode: Char_c
	mode: vi_insert
	event:[
	  # { edit: Clear }
	  { edit: InsertString,
		value: "cd (fd -t d | fzf)"

	  }
	  { send: Enter }
	  ]
	},
	{
	name: select_file_with_fzf
	modifier: CONTROL
	keycode: Char_t
	mode: vi_insert
	event:[
	  # { edit: Clear }
	  { edit: InsertString,
		value: "(fd -t f | fzf)"

	  }
	  { send: Enter }
	  ]
	}
	]
}
    '';
	shellAliases = {
		ll = "ls -la";
		la = "ls -a";

		cp = "cp -iv";
		mv = "mv -iv";
		rm = "rm -iv";

		vim= "nvim";
		vi= "nvim";

		za = "zathura";
		
		ze = "zellij";

		hell = "echo Hello party people";

		drag = "xdragon -a -x";

		update = "sudo nixos-rebuild switch --flake /home/lars/nixos-config/";


	};
  };

  programs.carapace = {
  	enable = true;
	enableNushellIntegration = true;
  };
  programs.zellij = {
  	enable = true;
	enableZshIntegration = true;
	settings = {
		theme = "gruvbox-dark";
		simplified_ui = true;
		default_layout = "compact";
		pane_frames = false;
	};
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.starship = {
      enable = true;
	  enableZshIntegration = true;
	enableNushellIntegration = true;
      settings = {
          add_newline = true;
      };
  };

  programs.direnv = {
      enable = true;
      enableZshIntegration = true; # see note on other shells below
	enableNushellIntegration = true;
      nix-direnv.enable = true;
  };

  colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-hard;

  home.file.".netrc".text = ''default
	login Lars
	password XFwZM9Fm98ZTmgJCqtLUPH2TCJvACtBCTma2hJSxBHWAmdpCr9sjJzu3LA9nvnS
  '';

  systemd.user = {
	services.nextcloud-autosync = {
	  Unit = {
		Description = "Auto sync Nextcloud";
		After = "network-online.target"; 
	  };
	  Service = {
		Type = "simple";
		ExecStart= "${pkgs.nextcloud-client}/bin/nextcloudcmd -h -n --path / /home/lars/Nextcloud https://nextcloud.larshumpert.com"; 
		TimeoutStopSec = "180";
		KillMode = "process";
		KillSignal = "SIGINT";
	  };
	  Install.WantedBy = ["multi-user.target"];
	};
	timers.nextcloud-autosync = {
	  Unit.Description = "Automatic sync files with Nextcloud when booted up after 5 minutes then rerun every 60 minutes";
	  Timer.OnBootSec = "5min";
	  Timer.OnUnitActiveSec = "30min";
	  Install.WantedBy = ["multi-user.target" "timers.target"];
	};
	startServices = true;
  };



  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
