{ pkgs, ...}: {
  # Enable nix <command> commands:
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
}
