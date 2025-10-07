{
  description = "Dessera's nixos configuration.";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";

    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nur.url = "github:nix-community/NUR";

    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    vscode-server.url = "github:nix-community/nixos-vscode-server";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    catppuccin.url = "github:catppuccin/nix";

    cygnus-rs = {
      url = "github:Dessera/cygnus-rs";
      inputs.flake-parts.follows = "flake-parts";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { flake-parts, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } (
      { self, ... }:
      {
        systems = [ "x86_64-linux" ];

        flake = {
          nixosConfigurations = {
            dessera-asus = self.lib.osUtils.mkNixProfile {
              system = "x86_64-linux";
              modules = [
                inputs.nixos-hardware.nixosModules.asus-fx506hm
                inputs.cygnus-rs.nixosModules.default
                ./entries/dessera-asus
                ./users/dessera
              ];
            };
          };

          # Utils lib.
          lib = import ./lib inputs;
        };

        perSystem =
          { pkgs, ... }:
          {
            formatter = pkgs.nixfmt-rfc-style;
            devShells.default = pkgs.mkShell {
              packages = with pkgs; [
                nixd
                nixfmt-rfc-style
                just
              ];
            };
          };
      }
    );
}
