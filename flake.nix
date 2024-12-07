{
  description = "DesseraNix system configuration with a desktop environment";

  inputs = {
    # Sources
    nixpkgs = {
      url = "github:nixos/nixpkgs?ref=nixos-unstable";
    };
    nur = {
      url = "github:nix-community/NUR";
    };
    nixos-hardware = {
      url = "github:NixOS/nixos-hardware/master";
    };
    vscode-server = {
      url = "github:nix-community/nixos-vscode-server";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    catppuccin = {
      url = "github:catppuccin/nix";
    };

    # Utils
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
    };

    # My modules (related to network)
    cygnus-rs = {
      url = "github:Dessera/cygnus-rs";
    };
    kwin-effects-forceblur = {
      url = "github:taj-ny/kwin-effects-forceblur";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      flake-parts,

      nixpkgs,

      nixos-hardware,
      home-manager,

      cygnus-rs,
      ...
    }@inputs:

    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];

      # NixOS
      flake = rec {

        nixosConfigurations = {
          dessera-nix = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = {
              inherit inputs;
            };
            modules = [
              nixos-hardware.nixosModules.asus-fx506hm
              home-manager.nixosModules.home-manager
              cygnus-rs.nixosModules.default
              nixosModules.default
              ./entries/dessera-nix

              (import ./users {
                hmModule = homeManagerModules.default;
                inherit (inputs) vscode-server;
              })
              ./users/dessera
            ];
          };
        };

        lib = import ./nix/lib.nix inputs;

        homeManagerModules = import ./nix/hm-module.nix lib;

        nixosModules = import ./nix/nixos-module.nix lib;
      };

      # Development shell
      perSystem =
        { pkgs, ... }:
        {
          formatter = pkgs.nixfmt-rfc-style;
          devShells.default = pkgs.mkShell {
            packages = with pkgs; [
              nixd
              nixfmt-rfc-style
              (callPackage ./scripts/build-os.nix { })
            ];
          };
        };
    };
}
