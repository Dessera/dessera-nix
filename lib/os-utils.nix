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
        # Home manager for user configuration
        home-manager.nixosModules.home-manager

        # NUR for more packages
        nur.modules.nixos.default

        # Theming framework
        stylix.nixosModules.stylix

        # Catppuccin theme for supplementation
        catppuccin.nixosModules.catppuccin
        (
          { ... }:
          {
            imports = modules;

            nixpkgs.overlays = [
              # Vscode extensions in `pkgs.vscode-marketplace` and `pkgs.open-vsx`
              nix-vscode-extensions.overlays.default
            ];

            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "bkp";

              sharedModules = [
                # Enable SSH support for VSCode
                vscode-server.homeModules.default

                # Plasma manager for plasma configuration
                plasma-manager.homeModules.plasma-manager

                # Theming framework
                # stylix.homeModules.stylix

                # Catppuccin theme for supplementation
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
