{ config, pkgs, ... }:

{
  users.users.alfianguide = {
     isNormalUser = true;
     shell = pkgs.fish;
     extraGroups = [ "wheel" "docker" "adbusers" ]; # Enable ‘sudo’ for the user.
  };

  nix.trustedUsers = [ "root" "alfianguide" ]; 
}
