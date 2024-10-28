{ lib
, fetchFromGitHub
, rustPlatform }:

rustPlatform.buildRustPackage rec {
  pname = "dont-repeat-yourself";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "StellarWitch7";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-XSsVctUzJNV0B/X3eWH4ONpRlzFzr03UBjr42H1srO8=";
  };

  cargoLock.lockFile = "${src}/Cargo.lock";
  doCheck = false;

  meta = with lib; {
    license = licenses.mit;
  };
}
