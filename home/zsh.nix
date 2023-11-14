{ config, pkgs, inputs, ... }:
{
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
}
