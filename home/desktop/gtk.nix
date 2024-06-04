{ config, pkgs, inputs, ... }:
let gruvboxPlus = import ./gruvbox-plus.nix { inherit pkgs; };
in {

  home.file.".local/share/icons/Gruvbox-Plus-Dark/".source = "${gruvboxPlus}";

  gtk = {
    enable = true;

    iconTheme.package = gruvboxPlus;
    iconTheme.name = "Gruvbox-Plus-Dark";
  };
}
