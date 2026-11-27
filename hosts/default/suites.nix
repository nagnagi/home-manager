{ suites, lib, internal, ... }:
  internal.loadSuites lib [
    suites.sway
    suites.develop
    suites.services.tailscale
    suites.apps
    suites.vimextra
  ]
