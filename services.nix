{ config, pkgs, ... }:

{
  services = {
    openssh.enable = true;
    xserver = {
        enable = true;
        #videoDrivers = [ "amdgpu" ];
        layout = "us";
        libinput.enable = true;
        xkbOptions = "eurosign:e";
        displayManager.sddm.enable = true;
        desktopManager = {
            plasma5 = {
                enable = true;
            };
        };
        extraDisplaySettings = ''
            Depth        24
            Modes        "1920x1080"
        '';
    };
    dnscrypt-proxy2 = {
      enable = true;
      settings = {
        ipv6_servers = true;
        require_dnssec = true;
        sources.public-resolvers = {
          urls = [
                "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v2/public-resolvers.md"
                "https://download.dnscrypt.info/resolvers-list/v2/public-resolvers.—"
          ];
          cache_file = "/var/lib/dnscrypt-proxy2/public-resolvers.—";
          minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
        };
        # You can choose a specific set of servers from https://github.com/DNSCrypt/dnscrypt-resolvers/blob/master/v2/public-resolvers.—
        # server_names = [ ... ];
      };
    };
  };
  
  systemd.services.dnscrypt-proxy2.serviceConfig = {
    StateDirectory = "dnscrypt-proxy";
  };

  security.pam.services.sddm.enableKwallet = true;
}
