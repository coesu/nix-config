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
  hardware.graphics.extraPackages = with pkgs; [rocmPackages.clr.icd];

  systemd.tmpfiles.rules = [
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
  ];

  services.ollama = {
    enable = true;
    package = pkgs.stable.ollama;
    acceleration = "rocm";
    environmentVariables = {
      # ROC_ENABLE_PRE_VEGA = "1";
      # HCC_AMDGPU_TARGET = "gfx1030";
      # HSA_OVERRIDE_GFX_VERSION = "10.3.0";
    };
    rocmOverrideGfx = "10.3.0";
  };
  hardware.graphics = {
    enable = true;
  };

  # Add user to necessary groups
  users.users.lars = {
    extraGroups = ["video" "render"];
  };

  # systemd.tmpfiles.rules = let
  #   rocmEnv = pkgs.symlinkJoin {
  #     name = "rocm-combined";
  #     paths = with pkgs.rocmPackages; [
  #       rocblas
  #       hipblas
  #       clr
  #     ];
  #   };
  # in [
  #   "L+    /opt/rocm   -    -    -     -    ${rocmEnv}"
  # ];
  # # Add ROCm packages to system environment
  # environment.systemPackages = with pkgs; [
  #   rocmPackages.clang-ocl
  #   rocmPackages.hipcc
  #   rocmPackages.hipblas
  #   rocmPackages.rocrand
  #   rocmPackages.rocsparse
  #   rocmPackages.rocm-cmake
  #   rocmPackages.rocm-device-libs
  #   cmake
  #   gcc
  # ];
  #
  # # Set necessary environment variables
  # environment.variables = {
  #   HSA_OVERRIDE_GFX_VERSION = "10.3.0"; # Adjust based on your GPU
  #   HIP_PLATFORM = "amd";
  #   PATH = ["/run/current-system/sw/bin"];
  # };
}
