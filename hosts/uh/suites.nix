{ suites, lib, ... }: {
  imports = lib.flatten [
    suites.sway.nixos
  ];
  home-manager.sharedModules = lib.flatten [
    suites.sway.home
  ];
}
