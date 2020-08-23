{ config, pkgs, ... }:

{

  # Enable the X11 windowing system.
#  services.xserver.enable = true;
  services.xserver = {
    enable = true;
    autorun = true;

    displayManager = {
      defaultSession = "none+dwm";
      lightdm = {
         enable = true;
      };
    };

    windowManager = {
      dwm = {
        enable = true;
      };
    };
#    windowManager = {
#      session = [{
#        name = "dwm";
#        start = "/run/current-system/sw/bin/dwm";
#      }];
#    };

    desktopManager = {
      xterm.enable = false;
    };
    
  };
  services.xserver.layout = "us";
  services.xserver.xkbOptions = "eurosign:e";

  # Enable the KDE Desktop Environment.
#  services.xserver.displayManager.sddm.enable = true;
#  services.xserver.desktopManager.plasma5.enable = true;

  # Enable touchpad support.
  services.xserver.libinput.enable = true;

}