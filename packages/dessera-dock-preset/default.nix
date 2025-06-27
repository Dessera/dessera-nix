{
  stdenv,
  lib,
}:
stdenv.mkDerivation {
  name = "dessera-dock-preset";
  src = lib.cleanSource ./.;

  installPhase = ''
    mkdir -p $out
    cp -r $src/* $out
  '';
}
