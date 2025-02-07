{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    user-lars.enable = lib.mkEnableOption "enable user-lars";
  };

  config = lib.mkIf config.user-lars.enable {
    users.users.lars = {
      isNormalUser = true;
      initialPassword = "123";
      extraGroups = [
        "wheel"
        "networkmanager"
        "docker"
      ];
      shell = pkgs.bashInteractive;
      packages = with pkgs; [
        nushell
        zsh
        qmk
      ];
    };
  };
}
