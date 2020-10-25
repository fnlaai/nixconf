{ config, pkgs, ... }:

{
  # xserver
  services.xserver = {
    enable = true;
    autorun = true;

    displayManager = {
      defaultSession = "none+dwm";
      lightdm = {
        enable = true;
        greeters = {
          gtk = {
            enable = true;
          };
	      };
      };
    };

    windowManager = {
      dwm = {
        enable = true;
      };
    };

    desktopManager = {
      xterm.enable = false;
    };
    
  };
  services.xserver.layout = "us";
  services.xserver.xkbOptions = "eurosign:e";
  services.xserver.libinput.enable = true;

  services.openssh.enable = true;
  virtualisation.docker.enable = true;
  services.logind.extraConfig = ''
   HandlePowerKey=ignore
  '';

  services.dnscrypt-proxy2 = {
    enable = true;
    settings = {
      ipv6_servers = true;
      require_dnssec = true;

      sources.public-resolvers = {
        urls = [
          "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v2/public-resolvers.md"
          "https://download.dnscrypt.info/resolvers-list/v2/public-resolvers.md"
        ];
        cache_file = "/var/lib/dnscrypt-proxy2/public-resolvers.md";
        minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
      };

      # You can choose a specific set of servers from https://github.com/DNSCrypt/dnscrypt-resolvers/blob/master/v2/public-resolvers.md
      # server_names = [ ... ];
    };
  };

  systemd.services.dnscrypt-proxy2.serviceConfig = {
    StateDirectory = "dnscrypt-proxy2";
  };
  # services.printing.enable = true;
  services.httpd.enable = true;
  services.httpd.adminAddr = "alfianguide@gmail.com";
  services.httpd.extraModules = [
    {
      name = "php7";
      path = "${pkgs.php}/modules/libphp7.so";
    }
  ];
  services.httpd.enablePHP = true;
  services.httpd.user = "alfianguide";
  services.httpd.group = "users";
  services.httpd.virtualHosts =
      let
      makeVirtualHost = { root, host}:
        {
          documentRoot = root;
          adminAddr = "admin@example.com";
          forceSSL = true;
          sslServerCert = "/home/alfianguide/ssl/${host}.crt";
          sslServerKey = "/home/alfianguide/ssl/${host}.key";
          extraConfig = ''
            <Directory "${root}">
                    Options Indexes FollowSymLinks
            AllowOverride All
            Require all granted
            DirectoryIndex index.php index.html
            </Directory>
          '';
        };
      in
        {
          "alfianguide.io" = (makeVirtualHost { root = "/home/alfianguide/prj/alfianguide"; host = "localhost"; });
          "siapmii.com" = (makeVirtualHost { root = "/home/alfianguide/prj/siapmii"; host = "localhost"; });
          "devufi.io" = (makeVirtualHost { root = "/home/alfianguide/prj/ufiacademy"; host = "devufi"; });
          "ufiprod.io" = (makeVirtualHost { root = "/home/alfianguide/prj/ufiprod"; host = "localhost"; });
        };
}
