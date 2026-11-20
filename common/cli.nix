{ pkgs, ... }: {
  home.packages = with pkgs; [
    flatpak
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

  services.pueue = {
    enable = true;
  };
}
