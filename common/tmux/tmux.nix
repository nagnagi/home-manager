{ pkgs, ... }: {
  programs.tmux = {
    enable = true;

    terminal = "tmux-256color";
    shell = "${pkgs.zsh}/bin/zsh";

    mouse = true;
    escapeTime = 0;
    baseIndex = 0;

    keyMode = "vi";
    prefix = "M-w";

    customPaneNavigationAndResize = true;

    extraConfig = builtins.readFile ./tmux.conf;
  };
}
