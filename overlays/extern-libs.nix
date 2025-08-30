inputs: self: final: prev: {
  externLibs = {
    toUpperInitial =
      str:
      let
        first = prev.lib.substring 0 1 str;
        rest = prev.lib.substring 1 (prev.lib.stringLength str) str;
      in
      prev.lib.concatStrings [
        (prev.lib.toUpper first)
        rest
      ];

    mkImage =
      image:
      let
        name = builtins.baseNameOf image;
        package = prev.callPackage (
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
}
