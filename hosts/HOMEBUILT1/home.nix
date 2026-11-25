{ pkgs, suites, lib, ... }: {
  home.username = "nag";
  home.homeDirectory = "/home/nag";
  home.stateVersion = "26.05";
  imports = [
    ../../home/profiles/genericLinux.nix
  ] ++ lib.flatten [
    suites.develop.home
  ];
}
