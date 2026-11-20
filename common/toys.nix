{ pkgs, ... }: {
  home.packages = with pkgs; [
    cmatrix
    cowsay
    sl
  ];
}
