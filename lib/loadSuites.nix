lib:
let
  pick = key: suiteList: lib.concatLists (map (s: s.${key} or [ ]) suiteList);
in
suiteList: {
  imports = pick "nixos" suiteList;
  home-manager.sharedModules = pick "home" suiteList;
}
