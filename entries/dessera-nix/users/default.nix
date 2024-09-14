{ config, ... }:

{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";

    users = {
      # dessera = import ./dessera;
      dessera = { ... }: {
        imports = [
          ../../../modules/home-manager.nix
          ./dessera
        ];
      };
    };
  };
}
