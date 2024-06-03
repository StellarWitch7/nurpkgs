{ lib
, rustPlatform
, fetchFromGitHub }:

(let
  pkgs = import <nixpkgs> {
    overlays = [
      (import (fetchTarball "https://github.com/oxalica/rust-overlay/archive/master.tar.gz"))
    ];
  };
in pkgs.makeRustPlatform {
  cargo = pkgs.rust-bin.stable.latest.minimal;
  rustc = pkgs.rust-bin.stable.latest.minimal;
}).buildRustPackage rec {
  pname = "playit";
  version = "0.15.11";

  src = fetchFromGitHub {
    owner = "playit-cloud";
    repo = "playit-agent";
    rev = "v${version}";
    sha256 = "sha256-RRN0KAgFVXQGU6LdNWClBFlqO+Nl4SMNXDWfV0lOhAE";
  };

  cargoLock.lockFile = "${src}/Cargo.lock";
  doCheck = false;
}
