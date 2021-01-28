{ config, pkgs, ... }:
let
  pbcopy = pkgs.writeScriptBin "pbcopy" ''
    #!${pkgs.stdenv.shell}
    xsel --clipboard --input
  '';
  pbpaste = pkgs.writeScriptBin "pbpaste" ''
    #!${pkgs.stdenv.shell}
    xsel --clipboard --output
  '';
in
{
  environment.systemPackages = with pkgs; [
    st
    dmenu
    tabbed
    feh
    xsel
    pbcopy
    pbpaste
    slstatus
    discord
    rustup
  ];

  nixpkgs.config = {
    allowUnfree = true;
    st.patches = [
      ./patches/st-nordtheme-0.8.2.diff
      ./patches/st-scrollback.diff
      ./patches/st-scrollback-mouse.diff
      ./patches/st-scrollback-mouse-altscreen.diff
    ];
    slstatus.patches = [
      ./patches/slstatus-patch.diff
      ./patches/slstatus-patch-locale.diff
    ];
    dwm.patches = [
      ./patches/dwm-systray-6.2.diff
      ./patches/dwm-resizehint-patch.diff
      ./patches/dwm-nord.diff
      ./patches/dwm-tabbed.diff
    ];
  };

  programs = {
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
      pinentryFlavor = "tty";
    };
    adb.enable = true;
    fish.enable = true;
  };
}
