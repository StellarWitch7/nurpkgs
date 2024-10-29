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
  version = "2.0.0";

  src = fetchFromGitHub {
    owner = maintainer;
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-OzcASKxUhLDopJVYqTYqfR8/nJ8uvXqmEKGKaOSSfwQ=";
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

  cargoLock = {
    lockFile = "${src}/Cargo.lock";

    outputHashes = {
      "x11-clipboard-0.9.3" = "sha256-rgFnPA4aqbfKLygpoyLTkfdLcB6v1cGlka0uUcUG574=";
    };
  };

  doCheck = false;

  meta = with lib; {
    homepage = "https://github.com/${maintainer}/${pname}";
    description = "Keyboard-only clipboard manager";
    license = licenses.mit;
    maintainers = [ maintainer ];
  };
}
