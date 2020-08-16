{ config, pkgs, ... }:

{
  virtualisation.docker.enable = true;
#  virtualisation.anbox.enable = true;

  programs.adb.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #   wget emacs vscodium firefox fish spotify phpstorm
    xclip
  ];

  nixpkgs.config.allowUnfree = true;

  programs.mtr.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryFlavor = "gnome3";
  };

  programs.fish.enable = true;

  
}
