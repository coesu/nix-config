{
  config,
  inputs,
  pkgs,
  ...
}: let
  variant = "dark";
in {
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        disable_loading_bar = true;
        hide_cursor = false;
        no_fade_in = true;
      };

      background = [
        {
          monitor = "";
          path = "~/nix-config/home/wallpaper.jpg";
        }
      ];

      input-field = [
        {
          monitor = "";

          size = "300, 50";

          outline_thickness = 1;

          fade_on_empty = false;

          dots_spacing = 0.2;
          dots_center = true;
        }
      ];

      label = [
        {
          monitor = "";
          text = "$TIME";
          font_size = 50;

          position = "0, 150";

          valign = "center";
          halign = "center";
        }
        {
          monitor = "";
          text = "cmd[update:3600000] date +'%a %b %d'";
          font_size = 20;

          position = "0, 50";

          valign = "center";
          halign = "center";
        }
      ];
    };
  };
}
