{ lib, ... }: {
  imports = builtins.filter
    (p: lib.hasSuffix ".nix" (toString p) && baseNameOf p != "default.nix")
    (lib.filesystem.listFilesRecursive ./.);
}
