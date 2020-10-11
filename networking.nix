{ config, pkgs, ... }:
{

  networking.hostName = "lumos";
  networking.networkmanager.enable = true;
  networking.networkmanager.unmanaged = [ "docker0" "virbr0" "anbox0" ];

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp5s0f1.useDHCP = true;
  networking.interfaces.wlp4s0.useDHCP = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  networking.extraHosts =
    ''
	127.0.0.1 siapmii.com siapmiiprod.com
	127.0.0.1 devufi.io ufiacademy.com ufiprod.io
  	127.0.0.1 dropit.io
    '';

  networking.resolvconf.useLocalResolver = true;
  networking.nameservers = [ "::1"];
  networking.networkmanager.dns = "none";
  networking.dhcpcd.extraConfig = "nohook resolv.conf";
}
