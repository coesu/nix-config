{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    stylix-option.enable = lib.mkEnableOption "enable stylix";
  };

  config = lib.mkIf config.stylix-option.enable {
    stylix = {
      enable = true;
      image = ./../../home/gruv-estimate.jpg;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";

      cursor.package = pkgs.bibata-cursors;
      cursor.name = "Bibata-Modern-Ice";
      cursor.size = 24;

      fonts = {
        monospace = {
          package = pkgs.nerd-fonts.jetbrains-mono;
          name = "JetBrainsMono Nerd Font Mono";
        };
        sansSerif = {
          package = pkgs.dejavu_fonts;
          name = "DejaVu Sans";
        };
        serif = {
          package = pkgs.dejavu_fonts;
          name = "DejaVu Serif";
        };
      };
      fonts.sizes = {
        applications = 12;
        terminal = 13;
        desktop = 12;
        popups = 12;
      };
      polarity = "dark";
    };
  };
}
