{ pkgs, ... }: {
  home.packages = with pkgs; [
    noto-fonts-cjk-sans
    plemoljp-nf
    font-awesome
    line-awesome
  ];
}
