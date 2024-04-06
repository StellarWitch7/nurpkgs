{ stdenv, pkgs, lib, fetchFromGitHub }:

stdenv.mkDerivation rec {
  name = "nixbrains-${version}";
  version = "1.2";

  src = fetchFromGitHub {
    owner = "StellarWitch7";
    repo = "nixbrains";
    rev = "v${version}";
    sha256 = "sha256-BDbyqADGr7MJn5qQ/ummDj2LG6g6pC0damQt/EnVLWA=";
  };

  installPhase = ''
    mkdir -p $out
    cp -r env $out/env
    cp -r bin $out/bin
    chmod -R +x $out/bin
  '';

  runtimeDeps = [ ];

  meta = with lib; {
    homepage = "https://github.com/StellarWitch7/nixbrains";
    description = "JetBrains IDE wrapper scripts for Nix environments";
    license = licenses.mit;
  };
}


