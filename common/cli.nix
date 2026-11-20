{ pkgs, ... }: {
  home.packages = with pkgs; [
    hostname
    zoxide
  ];

  programs.btop = {
    enable = true;
  };
  programs.eza = {
    enable = true;
  };
  programs.fzf = {
    enable = true;
  };
  programs.lazydocker = {
    enable = true;
  };
  programs.lazygit = {
    enable = true;
  };
  programs.nnn = {
    enable = true;
  };
  programs.vim = {
    enable = true;
  };

  services.pueue = {
    enable = true;
  };
}
