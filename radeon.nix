{ config, pkgs, ... }:

{
  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.kernelPatches = [
    { name = "amdgpu-config";
      patch = null;
      extraConfig = ''
        DRM_AMD_DC_DCN1_0 y
      '';
    }
  ];
  services.xserver.videoDrivers = [ "amdgpu" ];
  hardware.cpu.amd.updateMicrocode = true;
  hardware.opengl.enable = true;
  hardware.opengl.driSupport = true;
  hardware.opengl.driSupport32Bit = true;
  services.xserver.extraDisplaySettings = ''
      Depth        24
      Modes        "1920x1080"
  '';
}
