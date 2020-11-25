{ config, pkgs, ... }:

{
  services = {
    openssh.enable = true;
    xserver = {
        enable = true;
        videoDrivers = [ "amdgpu" ];
        layout = "us";
        libinput.enable = true;
        xkbOptions = "eurosign:e";
        displayManager.startx.enable = true;
        displayManager.sddm.enable = false;
        displayManager.lightdm.enable = false;
        desktopManager = {
          xterm = {
            enable = false;
          };
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
    httpd = {
      enable = true;
      adminAddr = "alfianguide@gmail.com";
      extraModules = [
        {name = "php7"; path = "${pkgs.php}/modules/libphp7.so"; }
      ];

      enablePHP = true;
      phpOptions = ''
          max_execution_time = 30
          post_max_size = 0
          upload_max_size = 0
          upload_max_filesize = 0
          memory_limit = 1G
      '';
      user = "alfianguide";
      group = "users";
      virtualHosts =
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
            "siapmii.com" = (makeVirtualHost { root = "/home/alfianguide/prj/siapmii"; host = "localhost"; });
            "devufi.io" = (makeVirtualHost { root = "/home/alfianguide/prj/ufiacademy"; host = "devufi"; });
            "ufiprod.io" = (makeVirtualHost { root = "/home/alfianguide/prj/ufiprod"; host = "localhost"; });
            "web.io" = (makeVirtualHost { root = "/home/alfianguide/"; host = "localhost"; });
          };
    };
  };
  
  systemd.services.dnscrypt-proxy2.serviceConfig.StateDirectory = "dnscrypt-proxy";

  security.pam.services.sddm.enableKwallet = true;
}
