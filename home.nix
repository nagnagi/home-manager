# ~/nix-config/home.nix
{ pkgs, ... }: {
  home.username = "nag";
  home.homeDirectory = "/home/nag";
  home.stateVersion = "26.05";
  targets.genericLinux.enable = true;
  programs.home-manager.enable = true;
  home.packages = with pkgs; [ ];
}
