# { meta, plasma-manager, ... }: rec {
#   mkNixosModule = import ./mkNixosModule.nix;
#   _importModule = import ./importModule.nix {
#     defaultArgs = { inherit meta plasma-manager; };
#   };
#   importModule = entry: _importModule ((import entry) importModule);
# }

defaultArgs: userArgs:
let args = defaultArgs // userArgs;
in {
  mkNixosModule = import ./mkNixosModule.nix;
  importModule = import ./importModule.nix args;
}
