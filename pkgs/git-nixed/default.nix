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
    sha256 = "sha256-/x4FTf+f6mcyjBegsiW8o5fQYBWrbsWUIvwYyu8+kCc=";
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
