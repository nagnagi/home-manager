{ pkgs, ... }: {
  programs.nix-ld.enable = true;

  programs.zsh = {
    enable = true;
  };
  programs.vim = {
    enable = true;
    defaultEditor = true;
  };
  programs.git = {
    enable = true;
  };
}
