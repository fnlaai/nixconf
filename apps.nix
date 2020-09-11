{ config, pkgs, ... }:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
   environment.systemPackages = with pkgs; [
  #   wget emacs vscodium firefox fish spotify phpstorm
      st
      dmenu
      tabbed
      slstatus
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
   nixpkgs.config.slstatus.patches = [
     ./slstatus-patch.diff
   ];
   programs.mtr.enable = true;
   programs.gnupg.agent = {
     enable = true;
     enableSSHSupport = true;
     pinentryFlavor = "gnome3";
   };
   programs.adb.enable = true;

   programs.fish.enable = true;
  
}