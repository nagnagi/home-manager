{ pkgs, lib, suites, ... }: {
  home.username = "nag";
  home.homeDirectory = "/home/nag";
  home.stateVersion = "26.05";

  imports = lib.flatten [
    suites.generic-linux.home
    suites.develop.home
    suites.sway.home
    suites.apps.home
  ];

  wayland.windowManager.sway.config = {
    output = {
      eDP-1 = {
        mode = "2160x1440@600.0Hz";
        scale = "1.25";
        bg = "${pkgs.sway}/share/backgrounds/sway/Sway_Wallpaper_Blue_2048x1536.png fill";
      };
    };
  };

  programs.emacs.package = pkgs.emacs-pgtk;
}
