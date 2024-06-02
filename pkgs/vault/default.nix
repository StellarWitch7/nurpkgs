{ stdenv
, lib
, fetchFromGitHub
, keepassxc
, sirikali }:

stdenv.mkDerivation rec {
  name = "vault-${version}";
  version = "1.2";

  src = fetchFromGitHub {
    owner = "StellarWitch7";
    repo = "vault";
    rev = "v${version}";
    sha256 = "sha256-WzGX0k0z9WAFEMnpPD/SfcDM5rnN1AKCM5KPkuSdR0w=";
  };

  buildInputs = [
    keepassxc
    sirikali
  ];

  installPhase = ''
    mkdir -p $out
    cp -r bin $out/bin
    chmod -R +x $out/bin
    ln -s ${keepassxc.out}/bin/keepassxc-cli $out/bin/keepassxc-cli
    ln -s ${sirikali.out}/bin/sirikali $out/bin/sirikali
  '';

  meta = with lib; {
    homepage = "https://github.com/StellarWitch7/vault";
    description = "KeePassXC-CLI and SiriKali wrapper scripts";
    license = licenses.mit;
  };
}
