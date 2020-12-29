{ config, pkgs, ... }:

{
  services.xserver.videoDrivers = [ "modesetting" ];
  hardware.nvidia.prime = {
    sync.enable = true;
    intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:1:0:0";
  };
  hardware.opengl.driSupport32Bit = true;
}
