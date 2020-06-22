{ config, pkgs, ... }:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
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
  
  users.users.alfianguide = {
     isNormalUser = true;
     shell = pkgs.fish;
     extraGroups = [ "wheel" "docker" ]; # Enable ‘sudo’ for the user.
   };
}