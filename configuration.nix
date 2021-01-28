{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./hw.nix
    ./apps.nix
    ./primary.nix
    ./networking.nix
    ./services.nix
    ./users.nix
    ./radeon.nix
  ];

  system.stateVersion = "21.03";
}
