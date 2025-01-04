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
        finalArgs =
          args
          // overrideArgs
          // {
            mlib = ret;
            moduleLib = ret;
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
        };
      in
      ret;
  };
}
