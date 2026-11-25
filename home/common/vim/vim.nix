{ pkgs, ... }: {
  programs.vim = {
    enable = true;
    defaultEditor = true;
    plugins = [
      pkgs.vimPlugins.fzf-vim
      pkgs.vimPlugins.vim-gitgutter
      pkgs.vimPlugins.gruvbox
      pkgs.vimPlugins.nerdtree
    ];
    extraConfig = builtins.readFile ./vimrc.vim;
  };
}
