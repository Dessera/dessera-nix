hmModule: _:

{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "bkp";

    sharedModules = [
      hmModule
    ];
  };
}
