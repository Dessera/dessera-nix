{
  stdenv,
  fetchFromGitHub,

  flavor ? "mocha",
}:

stdenv.mkDerivation {
  name = "catppuccin-konsole";

  src = fetchFromGitHub {
    owner = "catppuccin";
    repo = "konsole";
    rev = "3b64040e3f4ae5afb2347e7be8a38bc3cd8c73a8";
    hash = "sha256-d5+ygDrNl2qBxZ5Cn4U7d836+ZHz77m6/yxTIANd9BU=";
  };

  buildPhase = ''
    runHook preBuild

    mkdir -p $out/share/konsole
    cp themes/catppuccin-${flavor}.colorscheme $out/share/konsole

    runHook postBuild
  '';
}
