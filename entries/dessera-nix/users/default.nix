{ config, ... }:

{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";

    users = {
      dessera = import ./dessera;
    };

    extraSpecialArgs = {
      nur = config.nur;
    };
  };
}
