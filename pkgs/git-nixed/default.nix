{ stdenv
, lib
, fetchFromGitHub }:

stdenv.mkDerivation rec {
  name = "git-nixed";
  version = "1.0";

  src = fetchFromGitHub {
    owner = "StellarWitch7";
    repo = "git-nixed";
    rev = "v${version}";
    sha256 = "sha256-vV/8/o0SjLWKy/OsgI1yf1myh8DiH721bpI6/b0GuwY=";
  };

  installPhase = ''
    mkdir -p $out
    cp -r bin $out/bin
    chmod -R +x $out/bin
  '';

  meta = with lib; {
    homepage = "https://github.com/StellarWitch7/git-nixed";
    description = "Helper scripts for setting up a new Nix project environment";
    license = licenses.mit;
  };
}
