{ suites, lib, internal, ... }:
  internal.loadSuites lib [
    suites.sway
    suites.develop
  ]
