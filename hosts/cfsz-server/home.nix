{ pkgs, ... }: {
  home.stateVersion = "26.05";

  imports = [
    ../../home/profiles/zsh/zsh.nix
    ../../home/profiles/neovim.nix
  ];
}
