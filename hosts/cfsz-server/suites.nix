{ suites, lib, internal, ... }: {
  imports = lib.flatten [
    suites.develop.home
  ];
}
