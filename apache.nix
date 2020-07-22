{ config, pkgs, ... }:

{

services.httpd.enable = true;
services.httpd.adminAddr = "alfianguide@gmail.com";
services.httpd.extraModules = [
 {name = "php7"; path = "${pkgs.php}/modules/libphp7.so"; }
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
        "siapmii.com" = (makeVirtualHost { root = "/home/alfianguide/prj/siapmii"; host = "localhost"; });
        "devufi.io" = (makeVirtualHost { root = "/home/alfianguide/prj/ufiacademy"; host = "devufi"; });
	"ufiprod.io" = (makeVirtualHost { root = "/home/alfianguide/prj/ufiprod"; host = "localhost"; });
      };

}
