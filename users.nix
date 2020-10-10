{ config, pkgs, ... }:

{
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
     extraGroups = [ "wheel" "docker" "adbusers"]; # Enable ‘sudo’ for the user.
  };

  nix.trustedUsers = [ "root" "alfianguide" ];
  
}
