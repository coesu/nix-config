{
  pkgs,
  config,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    (pkgs.writeShellScriptBin
      "anyrun-dmenu"
      ''
        ${inputs.anyrun.packages.${pkgs.system}.anyrun}/bin/anyrun --plugins ${inputs.anyrun.packages.${pkgs.system}.stdin}/lib/libstdin.so --show-results-immediately true
      '')
    (pkgs.writeShellScriptBin
      "anyrun-symbols"
      ''
        ${inputs.anyrun.packages.${pkgs.system}.anyrun}/bin/anyrun --plugins ${inputs.anyrun.packages.${pkgs.system}.symbols}/lib/libsymbols.so --show-results-immediately true
      '')
    (pkgs.writeShellScriptBin
      "file-search-open"
      ''
        # Prompt the user to enter a file extension using wofi
        extension=$(echo -e "txt\npdf\njpg\npng\nmp3\nmp4\ngif\nzip\nrar\nhtml\njs\npy\ncpp\njava\nsh\nrs\ntoml\nyml" | anyrun-dmenu)
        file=$(${pkgs.fd}/bin/fd -e "$extension" -I --hidden . ~/ | anyrun-dmenu)
        xdg-open "$file"
      '')
    (pkgs.writeShellScriptBin
      "pdf-open"
      ''
        file=$(fd -e pdf -I . ~/ | anyrun-dmenu)
        echo $file
        xdg-open "$file"
      '')
    (pkgs.writeShellScriptBin
      "monitor-config-home"
      ''
        hyprctl keyword monitor eDP-1,disable
        hyprctl keyword monitor HDMI-A-1,preferred,0x0,1
        hyprctl keyword monitor HDMI-A-1,transform,1
        hyprctl keyword monitor DP-1,preferred,1080x0,1
      '')
    (pkgs.writeShellScriptBin
      "monitor-config-remote"
      ''
        hyprctl keyword monitor eDP-1,preferred,0x1080,1
        hyprctl keyword monitor HDMI-A-1,preferred,0x0,1
        hyprctl keyword monitor DP-1,preferred,1920x1080,1
      '')
  ];
}
