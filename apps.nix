{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  programs = {
    gnupg.agent = {
        enable = true;
        enableSSHSupport = true;
        pinentryFlavor = "tty";
    };
    fish.enable = true;
    adb.enable = true;
  };

  virtualisation.docker.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    xclip
    powerdevil
    mesa
  ];
}
