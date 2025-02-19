{
  description = "A highly integrated NixOS system module and a system configuration based on it. ";

  inputs = {
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
    };

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
    catppuccin = {
      url = "github:catppuccin/nix";
    };

    cygnus-rs = {
      url = "github:Dessera/cygnus-rs";
      inputs.flake-parts.follows = "flake-parts";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixcode = {
      url = "github:Dessera/nixcode";
      inputs.flake-parts.follows = "flake-parts";
    };
    firefox-nightly = {
      url = "github:nix-community/flake-firefox-nightly";
    };

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

  nixConfig = {
    extra-substituters = [
      "https://nixcode.cachix.org"
    ];

    extra-trusted-public-keys = [
      "nixcode.cachix.org-1:6FvhF+vlN7gCzQ10JIKVldbG59VfYVzxhH/+KGHvMhw="
    ];
  };

  outputs =
    { flake-parts, nixpkgs, ... }@inputs:
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
            firefox-nightly
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
            dessera-nix = nixpkgs.lib.nixosSystem {
              system = "x86_64-linux";
              specialArgs = {
                inherit inputs;
              };
              modules = [
                inputs.nixos-hardware.nixosModules.asus-fx506hm
                inputs.home-manager.nixosModules.home-manager
                inputs.nur.modules.nixos.default
                inputs.cygnus-rs.nixosModules.default
                (
                  { pkgs, ... }:
                  let
                    mlib = self.lib.mkLib { inherit pkgs; };
                  in
                  {
                    imports = [
                      (mlib.wrapModule self.nixosModuleWrapper)
                      ./entries/dessera-nix
                      ./users/dessera
                    ];

                    home-manager = {
                      useGlobalPkgs = true;
                      useUserPackages = true;
                      backupFileExtension = "bkp";

                      sharedModules = [
                        inputs.nixcode.hmModule
                        (mlib.wrapModule self.hmModuleWrapper)
                      ];

                      extraSpecialArgs = {
                        inherit inputs;
                      };
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
