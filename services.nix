{ config, pkgs, ... }:
{
  systemd.services.dnscrypt-proxy2.serviceConfig.StateDirectory = "dnscrypt-proxy";

  imports = [
    ./services/xserver.nix
    ./services/dnscrypt.nix
    ./services/httpd.nix
  ];

  services = {
    openssh.enable = true;

    logind.extraConfig = ''
      HandlePowerKey=ignore
    '';

    # printing.enable = true;
  };
}
