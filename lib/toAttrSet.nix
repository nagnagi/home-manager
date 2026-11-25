dir:
let
  entries = builtins.readDir dir;
  toAttr = name:
    let
      type = entries.${name};
      path = dir + "/${name}";
      m = builtins.match "(.*)\\.nix" name;
    in
      if type == "directory" then
        { inherit name; value = (import ./toAttrSet.nix) path; }
      else if type == "regular" && m != null && name != "default.nix" then
        { name = builtins.head m; value = import path; }
      else
        null;
in
  builtins.listToAttrs (builtins.filter (x: x != null)
    (map toAttr (builtins.attrNames entries)))
