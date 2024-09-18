{ lib
, makeRustPlatform
, fetchFromGitHub
, rust-bin }:

(makeRustPlatform {
  cargo = rust-bin.stable.latest.minimal;
  rustc = rust-bin.stable.latest.minimal;
}).buildRustPackage rec {
  pname = "playit";
  version = "0.15.11";

  src = fetchFromGitHub {
    owner = "playit-cloud";
    repo = "playit-agent";
    rev = "v${version}";
    sha256 = "sha256-jXd5pmnYi8fV/DeqiqhU3haCJZ/tDrKD4bW3uHikTxI=";
  };

  cargoLock.lockFile = "${src}/Cargo.lock";
  doCheck = false;

  meta = with lib; {
    # TODO
  };
}
