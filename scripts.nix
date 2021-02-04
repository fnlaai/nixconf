{ config, pkgs, ... }:
let
  pbcopy = pkgs.writeScriptBin "pbcopy" (builtins.readFile (./scripts/pbcopy));
  pbpaste = pkgs.writeScriptBin "pbpaste" (builtins.readFile (./scripts/pbpaste));
in
{
  environment.systemPackages = [ pbcopy pbpaste ];
}
