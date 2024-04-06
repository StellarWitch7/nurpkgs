{ stdenv, pkgs, lib, fetchFromGitHub }:

stdenv.mkDerivation rec {
  name = "nixbrains-${version}";
  version = "1.1";

  src = fetchFromGitHub {
    owner = "StellarWitch7";
    repo = "nixbrains";
    rev = "v${version}";
    sha256 = "sha256-N0BHOIOC7TYamC+4wf7obQ9FH+PwNnhIyk7OLht1gjo=";
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


