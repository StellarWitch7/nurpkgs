{ lib
, makeRustPlatform
, fetchFromGitHub }:

(let
  rpkgs = import <nixpkgs> {
    overlays = [
      (import (fetchTarball "https://github.com/oxalica/rust-overlay/archive/711ff40be18b09bf096930f52e1fb2fcbee9adf0.tar.gz"))
    ];
  };
in makeRustPlatform {
  cargo = rpkgs.rust-bin.stable.latest.minimal;
  rustc = rpkgs.rust-bin.stable.latest.minimal;
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
  preferLocalBuild = true;
}
