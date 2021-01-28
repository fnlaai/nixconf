{ config, pkgs, ... }:
{
  services = {
    httpd = {
      enable = true;
      adminAddr = "alfianguide@gmail.com";
      extraModules = [
        { name = "php7"; path = "${pkgs.php}/modules/libphp7.so"; }
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
          "web.io" = (makeVirtualHost { root = "/home/alfianguide/"; host = "localhost"; });
        };
    };
  };
}
