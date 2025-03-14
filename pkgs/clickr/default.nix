{ lib
, fetchFromGitHub
, rustPlatform }:

rustPlatform.buildRustPackage rec {
  pname = "clickr";
  version = "2.0.2";

  src = fetchFromGitHub {
    owner = "StellarWitch7";
    repo = "clickr";
    rev = "v${version}";
    sha256 = "sha256-rxkUzCT/RJsxOxFvUQpCKAA1Yyg5dBP481k2RMRC9xs=";
  };

  buildInputs = [
  ];

  cargoLock.lockFile = "${src}/Cargo.lock";
  doCheck = false;

  meta = with lib; {
    homepage = "https://github.com/StellarWitch7/clickr";
    description = "A P2P clicker";
    license = licenses.mit;
  };
}
