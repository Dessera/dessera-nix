{
  description = "Dessera's nixos modules and configurations.";

  inputs = {
    # Flake Helper
    flake-parts.url = "github:hercules-ci/flake-parts";
    systems.url = "github:nix-systems/default";

    # Packages
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Styles
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin = {
      url = "github:catppuccin/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Host
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    # Users
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    # VSCode
    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    vscode-server.url = "github:nix-community/nixos-vscode-server";
  };

  outputs =
    {
      flake-parts,
      systems,
      nixpkgs,
      ...
    }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = import systems;

      flake = rec {
        lib = nixpkgs.lib.extend (
          self: super: {
            dnix = import ./lib {
              inherit inputs;
              lib = self;
            };
          }
        );

        nixosModules = {
          default = import ./modules/nixos;
        };

        homeModules = {
          default = import ./modules/home;
        };

        nixosConfigurations = {
          dessera-asus = lib.dnix.profile.mkProfile {
            name = "dessera-asus";
            system = "x86_64-linux";
            modules = [
              inputs.nixos-hardware.nixosModules.asus-fx506hm
              nixosModules.default
              ./hosts/dessera-asus
              ./users/dessera
            ];
            homeModules = [
              homeModules.default
            ];
          };
        };
      };

      perSystem =
        { pkgs, ... }:
        {
          devShells.default = pkgs.mkShell {
            packages = with pkgs; [
              nixd
              nixfmt
              statix
            ];
          };
        };
    };
}
