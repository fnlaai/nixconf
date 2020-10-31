{ config, pkgs, ... }:

{
  # services.printing.enable = true;
  sound.enable = true;
  hardware.pulseaudio = {
    enable = true;
    extraConfig = ''
        load-module module-udev-detect tsched=0
    '';
    support32Bit = true;
  };
}
