{ inputs, ... }:

{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";

    sharedModules = [
      inputs.plasma-manager.homeManagerModules.plasma-manager
    ];

    users = {
      # dessera = import ./dessera;
      dessera =
        { ... }:
        {
          imports = [
            ../../../modules/home-manager.nix
            inputs.vscode-server.nixosModules.home
            ./dessera
          ];
        };
    };
  };
}
