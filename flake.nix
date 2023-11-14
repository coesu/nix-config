{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
    	url = "github:nix-community/home-manager";
	inputs.nixpkgs.follows = "nixpkgs";
    };

	xremap-flake.url = "github:xremap/nix-flake";
	
    nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = { self, nixpkgs, ... }@inputs:
  let
  	system = "x86_64-linux";
	pkgs = import nixpkgs {
		inherit system;
		config = {
			allowUnfree = true;
		};
	};
	
  in
  {
  
  nixosConfigurations = {
  	nixos = nixpkgs.lib.nixosSystem {
		specialArgs = { inherit inputs system; };

		modules = [
		./nixos/configuration.nix
		];
	};
  };
  };
}
