{ lib
, fetchFromGitHub
, rustPlatform
, makeWrapper
, xorg
, libxkbcommon
, libGL }:

let
  maintainer = "StellarWitch7";
in rustPlatform.buildRustPackage rec {
  pname = "dont-repeat-yourself";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = maintainer;
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-XSsVctUzJNV0B/X3eWH4ONpRlzFzr03UBjr42H1srO8=";
  };

  nativeBuildInputs = [
    makeWrapper
  ];

  buildInputs = [
    xorg.libX11
    xorg.libXcursor
    xorg.libxcb
    xorg.libXi
    libxkbcommon
    libGL
  ];

  postInstall = ''
    wrapProgram $out/bin/${pname} --set LD_LIBRARY_PATH ${lib.makeLibraryPath buildInputs}
  '';

  cargoLock.lockFile = "${src}/Cargo.lock";
  doCheck = false;

  meta = with lib; {
    homepage = "https://github.com/${maintainer}/${pname}";
    description = "Keyboard-only clipboard manager";
    license = licenses.mit;
    maintainers = [ maintainer ];
  };
}
