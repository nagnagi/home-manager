{ pkgs, ... }: {
  home.packages = with pkgs; [
    evince
    nautilus
    pwvucontrol
  ];
}
