{ stdenv, pkgs, lib, fetchFromGitHub }:

stdenv.mkDerivation rec {
  name = "vault-${version}";
  version = "1.1";

  src = fetchFromGitHub {
    owner = "StellarWitch7";
    repo = "vault";
    rev = "v${version}";
    sha256 = "sha256-tvc++eezpC2EM1uGuQ3Za+GgKFe9xPhX4VBLWQyibxY=";
  };

  installPhase = ''
    mkdir -p $out
    cp -r bin $out/bin
    chmod -R +x $out/bin
    ln -s ${pkgs.keepassxc.out}/bin/keepassxc-cli $out/bin/keepassxc-cli
    ln -s ${pkgs.sirikali.out}/bin/sirikali $out/bin/sirikali
  '';

  runtimeDeps = with pkgs; [
    keepassxc
    sirikali
  ];

  meta = with lib; {
    homepage = "https://github.com/StellarWitch7/vault";
    description = "KeePassXC-CLI and SiriKali wrapper scripts";
    license = licenses.mit;
  };
}
