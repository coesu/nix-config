{ config, pkgs, inputs, ... }:

{
	home.packages = (with pkgs.gnome; [ 
    nautilus
    gnome-tweaks
    eog

	]) ++ (with pkgs; [

	neovim
	emacs
	vim
	vifm
	git
	zsh

 	# cli stuff
	hello
	stow
    neofetch
	freshfetch
    zoxide
    eza
	thefuck
	zellij
	vifm
	sd
	ncdu
    fzf
	fd
	bat
	btop
	tldr
    zip
    unzip
	killall
	util-linux
	xdragon
	gnumake
	clang
  	glibc

	#rust and cli tools
	cargo
	rustc

	ripgrep
	porsmo
	ttyper
	speedtest-rs
	ncspot
	wiki-tui
	rust-analyzer

	python3
	nodejs
	ruff

	lua-language-server
	sshfs

	zathura
	evince
	inkscape
	graphviz

	thunderbird
	discord
	nextcloud-client

	zoom-us
	obs-studio
	chromium
	firefox
	obsidian





  ]) ++ (with pkgs.nodePackages; [
  	pyright
  ]) ;
}
