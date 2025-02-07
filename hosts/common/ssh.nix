{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    ssh.enable = lib.mkEnableOption "enable ssh";
  };

  config = lib.mkIf config.ssh.enable {
    programs.gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    services.openssh.enable = true;
  };
}
