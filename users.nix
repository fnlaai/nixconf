{ config, pkgs, ... }:

{
  users.users.alfianguide = {
     isNormalUser = true;
     shell = pkgs.fish;
     extraGroups = [ "wheel" "docker" "adbusers"];
  };

  nix.trustedUsers = [ "root" "alfianguide" ];
  
}
