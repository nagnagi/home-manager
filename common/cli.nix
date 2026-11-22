{ pkgs, lib, config, ... }: {
  home.packages = with pkgs; [
    hostname
    zoxide
    rclone
    wget
    zip
    nixd
    openssh
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
  programs.fd = {
    enable = true;
  };
  programs.ripgrep = {
    enable = true;
  };
  programs.tmux = {
    enable = true;
  };
  programs.gh = {
    enable = true;
  };
  programs.uv = {
    enable = true;
  };

  services.pueue = {
    enable = true;
  };
}
