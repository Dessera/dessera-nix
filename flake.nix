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
      "https://dessera-nix.cachix.org"
    ];

    extra-trusted-public-keys = [
      "nixcode.cachix.org-1:6FvhF+vlN7gCzQ10JIKVldbG59VfYVzxhH/+KGHvMhw="
      "dessera-nix.cachix.org-1:phychQjVuFCuJteogKtEql5UjhYsN+3fi9UzGMYquMU="
    ];
  };

  outputs =
    { flake-parts, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } (
      {
        self,
        flake-parts-lib,
        withSystem,
        ...
      }:
      let
        inherit (flake-parts-lib) importApply;
        meta = import ./meta;
      in
      {
        systems = [ "x86_64-linux" ];

        imports = [
          (importApply ./lib (inputs // { inherit meta; }))
        ];

        flake = {
          nixosConfigurations = {
            dessera-nix = self.lib.mkNixOS {
              system = "x86_64-linux";
              modules = [
                inputs.nixos-hardware.nixosModules.asus-fx506hm
                inputs.cygnus-rs.nixosModules.default
                ./entries/dessera-nix
                ./users/dessera
              ];
            };

            dessera-surface = self.lib.mkNixOS {
              system = "x86_64-linux";
              modules = [
                inputs.nixos-hardware.nixosModules.microsoft-surface-pro-intel
                ./entries/dessera-surface
                ./users/dessera-surface
              ];
            };
          };

          hmModuleWrapper = import ./modules/hm;
          nixosModuleWrapper = import ./modules/nixos;
        };

        perSystem =
          { pkgs, system, ... }:
          let
            code = withSystem system ({ inputs', ... }: inputs'.nixcode.packages.nixcode-nix);
          in
          {
            packages.microsoft-surface-common-cache-host =
              (pkgs.nixos [
                inputs.nixos-hardware.nixosModules.microsoft-surface-common
                (
                  { config, ... }:
                  {
                    nixpkgs.pkgs = pkgs;
                    boot.loader.systemd-boot.enable = !config.boot.loader.generic-extlinux-compatible.enable;
                    boot.loader.grub.enable = false;
                    fileSystems."/" = {
                      device = "/dev/disk/by-uuid/00000000-0000-0000-0000-000000000000";
                      fsType = "btrfs";
                    };
                    system.stateVersion = "25.05";
                  }
                )
              ]).config.system.build.toplevel;

            formatter = pkgs.nixfmt-rfc-style;
            devShells.default = pkgs.mkShell {
              packages =
                (with pkgs; [
                  nixd
                  nixfmt-rfc-style
                ])
                ++ [ code ];
            };
          };
      }
    );
}
