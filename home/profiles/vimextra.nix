{ pkgs, lib, ... }: {
  programs.vim.plugins = [
    pkgs.vimPlugins.fzf-vim
    pkgs.vimPlugins.vim-gitgutter
    pkgs.vimPlugins.gruvbox
    pkgs.vimPlugins.nerdtree
    pkgs.vimPlugins.vim-clap
    pkgs.vimPlugins.vim-surround
    pkgs.vimPlugins.vim-repeat
    pkgs.vimPlugins.vim-easymotion
    pkgs.vimPlugins.auto-pairs
    pkgs.vimPlugins.coc-nvim
    pkgs.vimPlugins.vim-airline
    pkgs.vimPlugins.vim-airline-themes
    pkgs.vimPlugins.vim-sleuth
    pkgs.vimPlugins.vim-quickrun
  ];
}
