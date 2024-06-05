{ pkgs, inputs, ... }: {
  programs.anyrun = {
    enable = true;
    config = {
      plugins = with inputs.anyrun.packages.${pkgs.system}; [
        applications
        randr
        rink
        shell
        symbols
        translate
        dictionary
        kidex
      ];
      x = { fraction = 0.5; };
      y = { fraction = 0.3; };
      width.fraction = 0.3;
      layer = "overlay";
      hidePluginInfo = true;
      closeOnClick = true;
    };

    # custom css for anyrun, based on catppuccin-mocha
    extraCss = ''
      #window {
        background: transparent;
      }

    '';
  };
}
