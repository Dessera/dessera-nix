{
  description = "Dessera's nixos configuration.";

  inputs = {
    # Flake Helper
    flake-parts.url = "github:hercules-ci/flake-parts";

    # Pkgs Source
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # OS Profile Extension
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    vscode-server.url = "github:nix-community/nixos-vscode-server";
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin = {
      url = "github:catppuccin/nix";
      inputs.nixpkgs.follows = "nixpkgs";
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
  };

  outputs =
    { flake-parts, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } (
      { self, ... }:
      let
        inherit (self.lib) osUtils;
      in
      {
        systems = [ "x86_64-linux" ];

        flake = {
          # OS Profiles
          nixosConfigurations = {
            dessera-asus = osUtils.mkNixProfile {
              system = "x86_64-linux";
              modules = [
                inputs.nixos-hardware.nixosModules.asus-fx506hm
                ./entries/dessera-asus
                ./users/dessera
              ];
            };
          };

          # Flake Level Helpers
          lib = import ./lib inputs;
        };

        perSystem =
          { pkgs, ... }:
          {
            devShells.default = pkgs.mkShell {
              packages = with pkgs; [
                nixd
                nixfmt
                just
              ];
            };
          };
      }
    );
}
