{ config, pkgs, ... }:
{
  services = {
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
}
