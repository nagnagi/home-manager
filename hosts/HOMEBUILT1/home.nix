{ pkgs, suites, lib, ... }: {
  home.username = "nag";
  home.homeDirectory = "/home/nag";
  home.stateVersion = "26.05";
  imports = lib.flatten [
    suites.generic-linux.home
    suites.develop.home
    suites.vimextra.home
  ];
}
