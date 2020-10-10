{ config, pkgs, ... }:

{
  virtualisation.docker.enable = true;
  programs.adb.enable = true;
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #   wget emacs vscodium firefox fish spotify phpstorm
    xclip
  ];

}
