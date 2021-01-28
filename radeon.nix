{ config, pkgs, ... }:

{
  boot.kernelPackages = pkgs.linuxPackages_latest;

  hardware = {
    enableRedistributableFirmware = true;
    cpu.amd.updateMicrocode = true;
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [
        amdvlk
      ];
      extraPackages32 = with pkgs; [
        driversi686Linux.amdvlk
      ];
    };
  };
}
