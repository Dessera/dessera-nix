{
  description = "A highly integrated NixOS system module and a system configuration based on it. ";

  inputs = {
    # Utils
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
    };

    # Sources
    nixpkgs = {
      url = "github:nixos/nixpkgs?ref=nixos-unstable";
    };

    nixpkgs-stable = {
      url = "github:nixos/nixpkgs?ref=nixos-24.11";
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
    catppuccin = {
      url = "github:catppuccin/nix";
    };

    # My modules (related to network)
    cygnus-rs = {
      url = "github:Dessera/cygnus-rs";
      inputs.flake-parts.follows = "flake-parts";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixcode = {
      url = "github:Dessera/nixcode";
      inputs.flake-parts.follows = "flake-parts";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # plasma
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
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
      nixpkgs-stable,
      nur,

      nixos-hardware,
      home-manager,

      cygnus-rs,
      ...
    }@inputs:

    flake-parts.lib.mkFlake { inherit inputs; } (
      { self, flake-parts-lib, ... }:
      let
        inherit (flake-parts-lib) importApply;

        libArgs = {
          inherit (inputs)
            plasma-manager
            kwin-effects-forceblur
            catppuccin
            vscode-server
            nixcode
            nur
            ;
          meta = import ./meta;
        };
      in
      {
        systems = [ "x86_64-linux" ];

        imports = [
          (importApply ./lib libArgs)
        ];

        flake = {
          nixosConfigurations = {
            dessera-nix = nixpkgs.lib.nixosSystem rec {
              system = "x86_64-linux";
              specialArgs = {
                pkgs-stable = import nixpkgs-stable {
                  inherit system;
                };
              };
              modules = [
                nixos-hardware.nixosModules.asus-fx506hm
                home-manager.nixosModules.home-manager
                nur.modules.nixos.default
                cygnus-rs.nixosModules.default
                (
                  { pkgs, ... }:
                  let
                    mlib = self.lib.mkLib { inherit pkgs; };
                    hmModule = mlib.wrapModule self.hmModuleWrapper;
                    nixosModule = mlib.wrapModule self.nixosModuleWrapper;
                  in
                  {
                    imports = [
                      nixosModule
                      ./entries/dessera-nix
                      ./users/dessera
                    ];

                    home-manager = {
                      useGlobalPkgs = true;
                      useUserPackages = true;
                      backupFileExtension = "bkp";

                      sharedModules = [
                        hmModule
                      ];
                    };
                  }
                )
              ];
            };
          };

          hmModuleWrapper = import ./modules/hm;
          nixosModuleWrapper = import ./modules/nixos;
        };

        perSystem =
          { pkgs, ... }:
          {
            formatter = pkgs.nixfmt-rfc-style;
            devShells.default = pkgs.mkShell {
              packages = with pkgs; [
                nixd
                nixfmt-rfc-style
              ];
            };
          };
      }
    );
}
