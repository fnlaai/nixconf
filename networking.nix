{ config, pkgs, ... }:

{
  networking = {
    hostName = "lambda";
    networkmanager.enable = true;
    useDHCP = false;
    #interfaces.enp5s0f1.useDHCP = true;
    interfaces.wlp4s0.useDHCP = true;
    # Configure network proxy if necessary
    # proxy.default = "http://user:password@proxy:port/";
    # proxy.noProxy = "127.0.0.1,localhost,internal.domain";
    # Open ports in the firewall.
    # networking.firewall.allowedTCPPorts = [ ... ];
    # networking.firewall.allowedUDPPorts = [ ... ];
    # Or disable the firewall altogether.
    firewall.enable = false;
    resolvconf.useLocalResolver = true;
    nameservers = [ "::1" ];
    networkmanager.dns = "none";
    dhcpcd.extraConfig = "nohook resolv.conf";
    extraHosts = ''
      127.0.0.1 alfianguide.io
      127.0.0.1 siapmii.com siapmiiprod.com
      127.0.0.1 devufi.io ufiacademy.com ufiprod.io
      127.0.0.1 dropit.io
      127.0.0.1 ngobar.io
    '';
  };
}
