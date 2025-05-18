{ nixpkgs, ... }@inputs:
{ self, ... }:
{
  flake = {
    lib.mkNixOS =
      {
        system,
        modules ? [ ],
        hmModules ? [ ],
      }:
      nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
        };
        modules = [
          inputs.home-manager.nixosModules.home-manager
          inputs.nur.modules.nixos.default
          (
            { ... }:
            {
              imports = [
                inputs.catppuccin.nixosModules.catppuccin
              ] ++ modules;

              nixpkgs.overlays = [ self.overlays.default ];

              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                backupFileExtension = "bkp";

                sharedModules = [
                  self.modules.plasmaManagerExtension
                  self.modules.catppuccinExtension
                  inputs.catppuccin.homeModules.catppuccin
                  inputs.plasma-manager.homeManagerModules.plasma-manager
                ] ++ hmModules;

                extraSpecialArgs = {
                  inherit inputs;
                };
              };
            }
          )
        ];
      };
  };
}
