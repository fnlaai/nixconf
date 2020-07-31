{ config, pkgs, ... }:

{
  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  # Enable touchpad support.
  services.xserver.libinput.enable = true;
}
