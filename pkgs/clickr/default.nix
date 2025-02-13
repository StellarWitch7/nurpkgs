{ lib
, fetchFromGitHub
, rustPlatform }:

rustPlatform.buildRustPackage rec {
  pname = "clickr";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "StellarWitch7";
    repo = "clickr";
    rev = "v${version}";
    sha256 = "sha256-v++UZxJFnHqD8ToAYcLbrD1tBdarR6O6uNFNL3yex+g=";
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
