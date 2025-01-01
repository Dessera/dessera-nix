defaultArgs: userArgs:
let
  args = defaultArgs // userArgs;
  moduleLib =
    let
      margs = args // {
        inherit moduleLib;
      };
    in
    rec {
      importModule = import ./importModule.nix margs;
      importModules = list: map importModule list;

      wrapNUR = import ./wrapNUR.nix;
    };
in
moduleLib
