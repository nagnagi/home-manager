{ suites, lib, internal, ... }: {
  imports = internal.loadSuites lib [
    suites.sway
    suites.develop
  ];
}
