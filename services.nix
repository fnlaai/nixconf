{ config, pkgs, ... }:

{
  services = {
    xserver = {
      enable = true;
      autorun = true;
      layout = "us";
      xkbOptions = "eurosign:e";
      libinput.enable = true;

      displayManager = {
        defaultSession = "none+dwm";
        lightdm.enable = false;
        sddm.enable = false;
        startx.enable = true;
      };

      windowManager = {
        dwm = {
          enable = true;
        };
      };
    };

    openssh.enable = true;

    logind.extraConfig = ''
      HandlePowerKey=ignore
    '';

    dnscrypt-proxy2 = {
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

    # printing.enable = true;
    httpd.enable = true;
    httpd.adminAddr = "alfianguide@gmail.com";
    httpd.extraModules = [
      {
        name = "php7";
        path = "${pkgs.php}/modules/libphp7.so";
      }
    ];

    httpd.enablePHP = true;
    httpd.user = "alfianguide";
    httpd.group = "users";
    httpd.virtualHosts =
      let
        makeVirtualHost = { root, host }:
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
        "devufi.io" = (makeVirtualHost { root = "/home/alfianguide/prj/ufiacademy"; host = "devufi"; });
        "ufiprod.io" = (makeVirtualHost { root = "/home/alfianguide/prj/ufiprod"; host = "localhost"; });
        "ngobar.io" = (makeVirtualHost { root = "/home/alfianguide/prj/ngobar"; host = "localhost"; });
      };
  };

  virtualisation.docker.enable = true;

  systemd.services.dnscrypt-proxy2.serviceConfig = {
    StateDirectory = "dnscrypt-proxy";
  };
}
