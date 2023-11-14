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
	./shell.nix
  ];

  home.username = "lars";
  home.homeDirectory = "/home/lars";

  home.file.".config/hypr" = {
  	enable = true;
  	source = ./hypr;
	recursive = true;
  };
  home.file.".config/waybar" = {
  	source = ./waybar;
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
