{ pkgs, ... }: {
  home.stateVersion = "26.05";

  imports = [
    ../../home/common
  ];
}
