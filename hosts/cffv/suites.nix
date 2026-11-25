{ suites, lib, ... }: {
  imports = lib.flatten [
    suites.sway.home
  ];
}
