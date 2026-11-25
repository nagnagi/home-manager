{
  nixos = [
    ../nixos/profiles/sway.nix
    ../nixos/profiles/greetd.nix
  ];
  home = [
    ../home/profiles/desktop/fonts.nix
    ../home/profiles/desktop/input-method.nix
    ../home/profiles/desktop/window-manager/sway.nix
  ];
}
