{ config, pkgs, ... }:


  let
    pbcopy = pkgs.writeScriptBin "pbcopy" ''
      #!${pkgs.stdenv.shell}
      xclip -selection clipboard
    '';
    pbpaste = pkgs.writeScriptBin "pbpaste" ''
      #!${pkgs.stdenv.shell}
      xclip -selection clipboard -o
    '';
  in {
    environment.systemPackages = [ pbcopy pbpaste ];
  }
