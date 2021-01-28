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

  i18n = {
    defaultLocale = "id_ID.UTF-8";
    extraLocaleSettings = {
      LC_TIME = "id_ID.UTF-8";
    };
  };

  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  time.timeZone = "Asia/Jakarta";
}
