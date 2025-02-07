{
  lib,
  pkgs,
  config,
  ...
}: {
  options = {
    ollamarocm.enable = lib.mkEnableOption "enables ollama with rocm";
  };

  config = lib.mkIf config.ollamarocm.enable {
    hardware.amdgpu.opencl.enable = true;
    hardware.graphics.extraPackages = with pkgs; [rocmPackages.clr.icd];

    systemd.tmpfiles.rules = [
      "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
    ];
    services.ollama = {
      enable = true;
      package = pkgs.stable.ollama;
      acceleration = "rocm";
      rocmOverrideGfx = "10.3.0";
    };
    hardware.graphics = {
      enable = true;
    };
    users.users.lars = {
      extraGroups = ["video" "render"];
    };
  };
}
