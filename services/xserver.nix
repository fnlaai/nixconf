{ config, pkgs, ... }:
{
  services = {
    xserver = {
      enable = true;
      autorun = true;
      layout = "us";
      xkbOptions = "eurosign:e";
      libinput.enable = true;

      displayManager = {
        defaultSession = "none+dwm";
        lightdm.enable = false;
        sddm.enable = false;
        startx.enable = true;
      };

      windowManager = {
        dwm = {
          enable = true;
        };
      };
    };
  };
}
