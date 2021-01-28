{ config, pkgs, ... }:
{
  systemd.services.dnscrypt-proxy2.serviceConfig.StateDirectory = "dnscrypt-proxy";

  security.pam.services.sddm.enableKwallet = true;

  imports = [
    ./services/xserver.nix
    ./services/dnscrypt.nix
    ./services/httpd.nix
  ];

  services.openssh.enable = true;
}
