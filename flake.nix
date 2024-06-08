{
  description = "A very basic NixOs flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = { url = "github:danth/stylix"; };
    nix-colors.url = "github:misterio77/nix-colors";
    anyrun = {
      url = "github:Kirottu/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }: {

    nixosConfigurations.aion = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/aion/
        inputs.stylix.nixosModules.stylix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
home-manager.backupFileExtension = "backup";

          home-manager.users.lars = import ./home;
          home-manager.extraSpecialArgs = { inherit inputs; };
        }
      ];
    };
    nixosConfigurations.nixl = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/nixl/
        inputs.stylix.nixosModules.stylix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
home-manager.backupFileExtension = "backup";

          home-manager.users.lars = import ./home;
          home-manager.extraSpecialArgs = { inherit inputs; };
        }
      ];
    };

  };
}
