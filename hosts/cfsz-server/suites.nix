{ suites, lib, ... }: {
  imports = lib.flatten [
    suites.develop.home
  ];
}
