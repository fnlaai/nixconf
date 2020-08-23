{ config, pkgs, ... }:

{
  users.users.alfianguide = {
     isNormalUser = true;
     shell = pkgs.fish;
     extraGroups = [ "wheel" "docker" ]; # Enable ‘sudo’ for the user.
   };
}