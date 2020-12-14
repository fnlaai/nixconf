{ config, pkgs, ... }:

{
  networking = {
    hostName = "lumos";
    networkmanager = {
      enable = true;
      unmanaged = [ "docker0" "virbr0" "anbox0" ];
      dns = "none";
    };
  # useDHCP = false;
  # interfaces.enp4s0.useDHCP = true;
  # interfaces.wlp6s0f3u3.useDHCP = true;
  # Configure network proxy if necessary
  # proxy.default = "http://user:password@proxy:port/";
  # proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  # Open ports in the firewall.
  # firewall.allowedTCPPorts = [ ... ];
  # firewall.allowedUDPPorts = [ ... ];
    firewall.enable = false;
    extraHosts = ''
    127.0.0.1 siapmii.com siapmiiprod.com
    127.0.0.1 devufi.io ufiacademy.com ufiprod.io
    127.0.0.1 dropit.io web.io
    192.168.43.211 acerpc
    '';
    resolvconf.useLocalResolver = true;
    nameservers = [ "::1"];
    dhcpcd.extraConfig = "nohook resolv.conf";
  };
}
