{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
     st
     dmenu
     tabbed
     feh
  ];

  nixpkgs.config.allowUnfree = true;

  nixpkgs.config.st.patches = [
    ./st-scrollback-0.8.2.diff
    ./st-scrollback-mouse-0.8.2.diff
    ./st-scrollback-mouse-altscreen-20190131-e23acb9.diff
    ./st-nordtheme-0.8.2.diff
  ];

  nixpkgs.config.dwm.patches = [
    ./dwm-systray-6.2.diff
    ./dwm-resizehint-patch.diff
    ./dwm-nord.diff
    ./dwm-tabbed.diff
  ];

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryFlavor = "tty";
  };
  
  programs.adb.enable = true;

  programs.fish.enable = true;
}
