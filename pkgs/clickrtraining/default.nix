{ lib
, fetchFromGitHub
, rustPlatform
, openssl
, alsa-lib
, pkgconf }:

rustPlatform.buildRustPackage rec {
  pname = "clickrtraining";
  version = "dev.1";

  src = fetchFromGitHub {
    owner = "enjarai";
    repo = "clickrtraining";
    # rev = "v${version}";
    rev = "0e57f5ed40c0f45f4153114462625a384cf2c171";
    sha256 = "sha256-4hvTPNyEZB7ph79oxaojotK3/ISp7WuboX5u96db36k=";
  };

  buildInputs = [
    alsa-lib
    openssl
  ];

  nativeBuildInputs = [
    pkgconf
  ];

  cargoLock.lockFile = "${src}/Cargo.lock";
  doCheck = false;

  meta = with lib; {
    homepage = "https://github.com/enjarai/clickrtraining";
    description = "A client and host for clicker training";
    # license = licenses.mit;
  };
}
