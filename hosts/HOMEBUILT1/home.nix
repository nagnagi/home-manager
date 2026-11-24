{ pkgs, ... }: {
  home.username = "nag";
  home.homeDirectory = "/home/nag";
  home.stateVersion = "26.05";
  imports = [
    ../../profiles/home/genericLinux.nix
    ../../profiles/home/zsh/zsh.nix
  ];
}
