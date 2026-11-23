{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs@{ nixpkgs, nix-index-database, home-manager, ... }:
    let
      mkHome = { system, host }: home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        modules = [
          nix-index-database.homeModules.nix-index
          ./common
          ./hosts/${host}/home.nix
        ];
      };

      mkNixHome = { host }: nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/${host}/configuration.nix
          home-manager.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { inherit inputs; };
              sharedModules = [
                inputs.nix-index-database.homeModules.nix-index
              ];
              users.nag = {
                imports = [
                  ./common
                  ./hosts/${host}/home.nix
                ];
              };
            };
          }
        ];
      };
    in {
      homeConfigurations = {
        "nag@HOMEBUILT1" = mkHome {
          system = "x86_64-linux";
          host = "HOMEBUILT1";
        };
        "nag@cffv" = mkHome {
          system = "x86_64-linux";
          host = "cffv";
        };
      };
      nixosConfigurations = {
        uh = mkNixHome {
          host = "uh";
        };
        cfsz-server = mkNixHome {
          host = "cfsz-server";
        };
      };
    };
}
