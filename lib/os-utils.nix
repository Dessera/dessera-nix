inputs: self: {
  mkNixOS =
    {
      system,
      modules ? [ ],
      hmModules ? [ ],
    }:
    inputs.nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit inputs;
      };
      modules = [
        inputs.home-manager.nixosModules.home-manager
        inputs.nur.modules.nixos.default
        inputs.catppuccin.nixosModules.catppuccin
        (
          { ... }:
          {
            imports = modules;

            nixpkgs.overlays = [
              inputs.nix-vscode-extensions.overlays.default
              self.overlays.externPkgs
              self.overlays.externLibs
            ];

            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "bkp";

              sharedModules = [
                self.modules.catppuccinExtension
                inputs.catppuccin.homeModules.catppuccin
                inputs.plasma-manager.homeManagerModules.plasma-manager
              ]
              ++ hmModules;

              extraSpecialArgs = {
                inherit inputs;
              };
            };
          }
        )
      ];
    };
}
