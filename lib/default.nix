{
  plasma-manager,
  kwin-effects-forceblur,

  catppuccin,

  vscode-server,
  nixcode,

  nur,

  meta,
}@args:
{ ... }:
{
  flake = {
    lib.mkLib =
      { pkgs, ... }@overrideArgs:
      let
        nixLib = pkgs.lib;

        finalArgs =
          args
          // overrideArgs
          // {
            mlib = ret;
          };

        ret = {
          wrapModule = entry: entry finalArgs;
          wrapModules = map ret.wrapModule;
          importModule = entry: ret.wrapModule (import entry);
          importModules = map ret.importModule;

          wrapNUR =
            { nur, pkgs }:
            (import nur {
              nurpkgs = pkgs;
              inherit pkgs;
            });

          mkImage =
            image:
            let
              name = builtins.baseNameOf image;
              package = pkgs.callPackage (
                { stdenv }:
                stdenv.mkDerivation {
                  inherit name;
                  phases = [ "installPhase" ];
                  installPhase = ''
                    mkdir -p $out
                    cp ${image} $out/${name}
                  '';
                }
              ) { };
            in
            "${package}/${name}";

          mkAliasOptionModule =
            from: to:
            nixLib.doRename {
              inherit from to;
              visible = false;
              warn = false;
              use = x: x;
            };

          toUpperInitial =
            str:
            let
              first = nixLib.substring 0 1 str;
              rest = nixLib.substring 1 (nixLib.stringLength str) str;
            in
            nixLib.concatStrings [
              (nixLib.toUpper first)
              rest
            ];
        };
      in
      ret;
  };
}
