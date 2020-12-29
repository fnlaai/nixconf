{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./hw.nix
      ./apps.nix
      ./primary.nix
      ./networking.nix
      ./services.nix
      ./users.nix
      ./nvidia.nix
    ];

  system.stateVersion = "unstable";
}
