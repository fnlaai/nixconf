{ config, pkgs, ... }:

{
  boot = {
    initrd.kernelModules = [ "amdgpu" ];
    loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
    };
    supportedFilesystems = [ "ntfs" ];
  };

  i18n.defaultLocale = "en_US.UTF-8";

  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };
  
  time.timeZone = "Asia/Jakarta";
}
