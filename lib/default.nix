defaultArgs: userArgs:
let
  args = defaultArgs // userArgs;
  library = rec {
    importModule = import ./importModule.nix library args;
    importModules = list: map importModule list;

    wrapNUR = import ./wrapNUR.nix;
  };
in
library
