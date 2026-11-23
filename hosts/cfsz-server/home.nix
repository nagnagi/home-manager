{ pkgs, ... }: {
  home.stateVersion = "26.05";

  imports = [
    ../../profiles/zsh/zsh.nix
  ];
}
