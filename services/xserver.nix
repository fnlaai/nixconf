{ config, pkgs, ... }:
{
  services = {
    xserver = {
      enable = true;
      videoDrivers = [ "amdgpu" ];
      layout = "us";
      libinput.enable = true;
      xkbOptions = "eurosign:e";
      displayManager.startx.enable = true;
      displayManager.sddm.enable = false;
      displayManager.lightdm.enable = false;
      desktopManager = {
        xterm = {
          enable = false;
        };
        plasma5 = {
          enable = true;
        };
      };
      extraDisplaySettings = ''
        Depth        24
        Modes        "1920x1080"
      '';
    };
  };
}
