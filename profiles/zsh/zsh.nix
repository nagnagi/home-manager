{ pkgs, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = false;
    initContent = builtins.readFile ./zshrc.zsh;
  };
}
