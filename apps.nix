{ config, pkgs, ... }:

{
  # List packages installed in system profile. To search, run:
# $ nix search wget
  
  virtualisation.docker.enable = true;
# virtualisation.anbox.enable = true;
  programs.adb.enable = true;

  # environment.systemPackages = with pkgs; [
  #   wget emacs vscodium firefox fish spotify phpstorm
  # ];

  nixpkgs.config.allowUnfree = true;

  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryFlavor = "gnome3";
  };

 programs.fish.enable = true; 

}
