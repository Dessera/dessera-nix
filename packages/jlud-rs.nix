{ lib
, stdenv
, fetchurl
, makeWrapper
, userFile
, configFile
}:

stdenv.mkDerivation rec {
  pname = "jlud-rs";
  version = "0.1.5";
  src = fetchurl {
    url = "https://github.com/Dessera/jlud-rs/releases/download/v${version}/jlud.tar.gz";
    sha256 = "0nmwhrym0k4nfl5vgwsg1i62raligi6cf8absab57fchl48cbgyw";
  };

  meta = with lib; {
    description = "JLU Drcom Implementation by Rust";
    homepage = "https://github.com/Dessera/jlud-rs";
    license = licenses.mit;
    platforms = platforms.linux;
  };

  buildInputs = [ makeWrapper ];

  unpackPhase = ''
    mkdir -p $out
    tar -xzf $src -C $out
  '';

  # call program like jlud -c /etc/jlud.toml -u /etc/user.passwd auth
  # wrapper jlud-auth will be created in $out/bin to simplify the command
  installPhase = ''
    mkdir -p $out/bin
    mkdir -p $out/etc
    cp ${userFile} $out/etc/user.passwd
    cp ${configFile} $out/etc/jlud.toml

    makeWrapper $out/jlud $out/bin/jlud-auth \
      --add-flags "-c $out/etc/jlud.toml -u $out/etc/user.passwd auth"
  '';
}
