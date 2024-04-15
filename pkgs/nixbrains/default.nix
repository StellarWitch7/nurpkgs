{ stdenv, pkgs, lib, fetchFromGitHub }:

stdenv.mkDerivation rec {
  name = "nixbrains-${version}";
  version = "1.3";

  src = fetchFromGitHub {
    owner = "StellarWitch7";
    repo = "nixbrains";
    rev = "v${version}";
    sha256 = "sha256-B9qal5ae6kft6aVN+m/vrbrII6GOHHhYW3D37GVdCEg=";
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


