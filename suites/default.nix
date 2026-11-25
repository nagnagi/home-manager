lib:
let
  dir = ./.;
  entries = lib.filterAttrs
    (name: type:
      type == "regular"
      && lib.hasSuffix ".nix" name
      && name != "default.nix")
    (builtins.readDir dir);
in
  lib.mapAttrs'
    (name: _:
      lib.nameValuePair
      (lib.removeSuffix ".nix" name)
      (import (dir + "/${name}")))
    entries
