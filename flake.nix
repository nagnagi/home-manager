{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { nixpkgs, home-manager, ... }:
    let
      makeHome = { system, host }:
      home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        modules = [
          ./common
          ./hosts/${host}.nix
        ];
      };
    in {
      homeConfigurations = {
        "nag@HOMEBUILT1" = makeHome {
          system = "x86_64-linux";
          host = "HOMEBUILT1";
        };
        "nag@cffv" = makeHome {
          system = "x86_64-linux";
          host = "cffv";
        };
      };
    };
}
