{ pkgs, ... }: {
  home.username = "nag";
  home.homeDirectory = "/home/nag";
  home.stateVersion = "26.05";
  imports = [
    ../../profiles/genericLinux.nix
    ../../profiles/zsh/zsh.nix
  ];
}
