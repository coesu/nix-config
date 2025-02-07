{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    sound-option.enable = lib.mkEnableOption "enable sound";
  };

  config = lib.mkIf config.sound-option.enable {
    hardware.bluetooth.enable = true;
    hardware.bluetooth.powerOnBoot = true;
    services.blueman.enable = true;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.enable = true;
      jack.enable = true;
    };
    services.jack.alsa.enable = true;
  };
}
