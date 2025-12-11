{
  nixpkgs,
  home-manager,
  nur,
  stylix,
  nix-vscode-extensions,
  plasma-manager,
  vscode-server,
  catppuccin,
  ...
}@inputs:
{
  mkNixProfile =
    {
      system,
      modules ? [ ],
      hmModules ? [ ],
    }:
    let
      specialArgs = { inherit inputs; };
    in
    nixpkgs.lib.nixosSystem {
      inherit system specialArgs;
      modules = [
        home-manager.nixosModules.home-manager
        nur.modules.nixos.default
        stylix.nixosModules.stylix
        catppuccin.nixosModules.catppuccin
        (
          { ... }:
          {
            imports = modules;

            nixpkgs.overlays = [
              nix-vscode-extensions.overlays.default
            ];

            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "bkp";

              sharedModules = [
                vscode-server.homeModules.default
                plasma-manager.homeModules.plasma-manager
                catppuccin.homeModules.catppuccin
              ]
              ++ hmModules;

              extraSpecialArgs = specialArgs;
            };
          }
        )
      ];
    };
}
