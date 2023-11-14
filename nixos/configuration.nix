# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.home-manager
      inputs.xremap-flake.nixosModules.default
    ];

  home-manager = {
  	extraSpecialArgs = {inherit inputs; };
	users = {
		lars = import ./../home/home.nix;
	};
  };
  # Bootloader.
  boot.loader.grub = {
  	enable = true;
	device = "nodev";
	useOSProber = true;
	efiSupport = true;
  };
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  boot.extraModulePackages = [
	config.boot.kernelPackages.v4l2loopback.out
  ];
  boot.kernelModules = [ "v4l2loopback" ];
  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  # services.xserver.displayManager.gdm.enable = true;
  # services.xserver.desktopManager.gnome.enable = true;
  services.xserver.displayManager = {
	sddm.enable = true;
	sddm.theme = "${import ./sddm-theme.nix { inherit pkgs; }}";
  };

  programs.hyprland = {
	enable = true;
	xwayland.enable = true;
	portalPackage = pkgs.xdg-desktop-portal-hyprland;
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    EDITOR = "nvim";
    TERMINAL = "alacritty";
    TERM = "alacritty";
  };

  programs.zsh.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "de";
    xkbVariant = "";
  };

  # Configure console keymap
  console.keyMap = "de";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  security.pam.services.swaylock = {};
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
	wireplumber.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  services.gvfs.enable = true;
  services.udisks2.enable = true;


  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
  };

  

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.lars = {
    isNormalUser = true;
    description = "Lars";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    ];
    shell = pkgs.nushell;
  };

  services.xremap = {
  	withHypr = true;
	# withWlroots = true;
	userName = "lars";
	watch = true;
	config = {
		modmap = [
			{
				name = "Global";
				remap = { "CapsLock" = "Esc"; };
			}
		];
		keymap = [
			{
				name = "main remaps";
				remap = { ALT_R-s = "ALT_R-8"; };
				remap = { ALT_R-d = "ALT_R-9"; };
				remap = { ALT_R-a = "ALT_R-7"; };
				remap = { ALT_R-f = "ALT_R-0"; };
			}
		];
	};
  };
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget

  # essentials
  neovim
  vim
  wget
  git
  firefox

  # Hyprland stuff and other essentials
  (waybar.overrideAttrs (oldAttrs: {
	mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      })
  )
  mako
  libnotify
  swaybg
  swaylock
  swayidle
  kitty
  alacritty
  rofi-wayland
  networkmanagerapplet
  pavucontrol
  pamixer
  playerctl
  grim
  slurp
  wl-clipboard
  libsForQt5.qt5.qtquickcontrols2   
  libsForQt5.qt5.qtgraphicaleffects


  gnome.gnome-keyring

  ];
  fonts.packages = with pkgs; [
    aileron
    hackgen-nf-font
    hack-font
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
  ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nix.gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 4d";
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?

}
