{ stdenv, pkgs, lib, fetchFromGitHub }:

stdenv.mkDerivation rec {
  name = "vault-${version}";
  version = "1.0";

  src = fetchFromGitHub {
    owner = "StellarWitch7";
    repo = "vault";
    rev = "v${version}";
    sha256 = "sha256-rYmVawkdVOBFuCzGN/pLpesXIQqADu6/Aw4EJhiCWRI=";
  };

  installPhase = ''
    mkdir -p $out
    cp -r bin $out/bin
    chmod -R +x $out/bin
  '';

  runtimeDeps = [ pkgs.sirikali ];

  meta = with lib; {
    homepage = "https://github.com/StellarWitch7/vault";
    description = "SiriKali wrapper scripts";
    license = licenses.mit;
  };
}
