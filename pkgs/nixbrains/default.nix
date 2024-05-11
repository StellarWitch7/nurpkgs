{ stdenv, pkgs, lib, fetchFromGitHub }:

stdenv.mkDerivation rec {
  name = "nixbrains-${version}";
  version = "1.5";

  src = fetchFromGitHub {
    owner = "StellarWitch7";
    repo = "nixbrains";
    rev = "v${version}";
    sha256 = "sha256-I7URJqYdtdqAU/13k85oFEUCX2R2XnQGKjx8EEUwNnQ=";
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
