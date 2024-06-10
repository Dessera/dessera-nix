{ ... }:

{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";

    users = {
      dessera = import ./dessera;
      # gdm = import ./gdm;
    };
  };
}
