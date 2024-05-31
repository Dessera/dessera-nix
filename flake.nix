{
  description = "DesseraNix system configuration with a desktop environment";

  inputs = {
    # Sources
    nixpkgs = {
      url = "github:nixos/nixpkgs?ref=nixos-unstable";
    };
    nixos-hardware = {
      url = "github:NixOS/nixos-hardware/master";
    };
    nur = {
      url = "github:nix-community/NUR";
    };

    # Utils
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
    };
    devshell = {
      url = "github:numtide/devshell";
    };
  };

  outputs =
    inputs@{ self
    , nixpkgs
    , flake-parts
    , devshell
    , home-manager
    , nixos-hardware
    , nur
    , ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];
      imports = [ devshell.flakeModule ];

      # NixOS
      flake = {
        nixosConfigurations = {
          dessera-nix = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
              home-manager.nixosModules.home-manager
              nixos-hardware.nixosModules.asus-fx506hm
              ./entries/dessera-nix
            ];
          };
        };
      };

      # Development shell
      perSystem = { config, pkgs, ... }: {
        formatter = pkgs.nixpkgs-fmt;
        devshells.default = {
          packages = with pkgs; [ nil nixpkgs-fmt ];
          commands = [
            {
              help = "Build the NixOS configuration";
              command = "nixos-rebuild switch --flake .";
              name = "switch-os";
            }
          ];
        };
      };
    };
}
