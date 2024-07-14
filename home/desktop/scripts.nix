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
        ${inputs.anyrun.packages.${pkgs.system}.anyrun}/bin/anyrun --plugins ${inputs.anyrun.packages.${pkgs.system}.symbols}/lib/libsymbols.so --show-results-immediately true | ${pkgs.wl-clipboard}/lib/wl-copy
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
  ];
}
