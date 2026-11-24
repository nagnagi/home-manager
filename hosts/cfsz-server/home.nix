{ pkgs, ... }: {
  home.stateVersion = "26.05";

  imports = [
    ../../profiles/home/zsh/zsh.nix
  ];
}
