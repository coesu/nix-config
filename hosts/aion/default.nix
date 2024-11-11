{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../configuration.nix
    ./sddm.nix
    ./hardware-configuration.nix
  ];
  networking.hostName = "aion";

  virtualisation.docker.enable = true;

  hardware.amdgpu.opencl.enable = true;
  services.ollama = {
    enable = true;
    acceleration = "rocm";
    environmentVariables = {
      # ROC_ENABLE_PRE_VEGA = "1";
      HCC_AMDGPU_TARGET = "gfx1030";
      # HSA_OVERRIDE_GFX_VERSION = "10.3.0";
    };
    rocmOverrideGfx = "10.3.0";
  };
}
