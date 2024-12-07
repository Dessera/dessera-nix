{ hmModule, vscode-server }:
_:

{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "bkp";

    sharedModules = [
      vscode-server.nixosModules.home
      hmModule
    ];
  };
}
