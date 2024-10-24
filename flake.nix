{
  description = "DesseraNix system configuration with a desktop environment";

  inputs = {
    # Sources
    nixpkgs = {
      url = "github:nixos/nixpkgs?ref=nixos-unstable";
    };
    nixpkgs-master = {
      url = "github:nixos/nixpkgs";
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
    # Utils

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
    };
    devshell = {
      url = "github:numtide/devshell";
    };

    # My modules
    cygnus-rs = {
      url = "github:Dessera/cygnus-rs";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      nixpkgs,
      nixpkgs-master,
      nixos-hardware,
      flake-parts,
      devshell,
      home-manager,
      cygnus-rs,
      ...
    }:

    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];
      imports = [ devshell.flakeModule ];

      # NixOS
      flake = {
        nixosConfigurations = {
          dessera-nix = nixpkgs.lib.nixosSystem rec {
            system = "x86_64-linux";
            specialArgs = {
              inherit inputs;
              pkgs-master = import nixpkgs-master {
                inherit system;
              };
            };
            modules = [
              nixos-hardware.nixosModules.asus-fx506hm
              home-manager.nixosModules.home-manager
              cygnus-rs.nixosModules.default
              ./modules
              ./entries/dessera-nix
            ];
          };
        };
      };

      # Development shell
      perSystem =
        { pkgs, ... }:
        {
          formatter = pkgs.nixpkgs-fmt;
          devshells.default = {
            packages = with pkgs; [
              nixd
              nixfmt-rfc-style
            ];
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
