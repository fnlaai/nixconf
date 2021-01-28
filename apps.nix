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
in
{
  programs = {
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
      pinentryFlavor = "tty";
    };
    fish.enable = true;
    adb.enable = true;
  };

  virtualisation = {
    docker.enable = true;
  };

  environment.systemPackages = with pkgs; [
    xclip
    pbcopy
    pbpaste
    st
    dmenu
    discord
  ];

  nixpkgs.config = {
    allowUnfree = true;
    st.patches = [
      ./patches/st-scrollback-20200419-72e3f6c.diff
      ./patches/st-scrollback-mouse-20191024-a2c479c.diff
      ./patches/st-scrollback-mouse-altscreen-20200416-5703aa0.diff
      ./patches/st-nordtheme-0.8.2.diff
      ./patches/st-0.8.2-font-patch.diff
    ];
  };
}
