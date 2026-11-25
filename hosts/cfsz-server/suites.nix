{ suites, lib, internal, ... }: {
  imports = lib.flatten [
    suites.develop.home
    suites.services.flatpak
    suites.services.sshd
  ];
}
