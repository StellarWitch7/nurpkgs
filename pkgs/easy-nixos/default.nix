{ stdenv, pkgs, lib, fetchFromGitHub }:

stdenv.mkDerivation rec {
  name = "easy-nixos-${version}";
  version = "1.1";

  src = fetchFromGitHub {
    owner = "StellarWitch7";
    repo = "easy-nixos";
    rev = "v${version}";
    sha256 = "sha256-LlWVlVNuq3Q9OSrnWfJCA+AlPuOOJX7ZMSDVKOkiAZU=";
  };

  installPhase = ''
    mkdir -p $out
    cp -r bin $out/bin
    chmod -R +x $out/bin
    ln -s ${pkgs.home-manager.out}/bin/home-manager $out/bin/home-manager
  '';

  runtimeDeps = with pkgs; [
    home-manager
    git
    nano
  ];

  meta = with lib; {
    homepage = "https://github.com/StellarWitch7/easy-nixos";
    description = "Wrapper and helper scripts to ease management of a NixOS system";
    license = licenses.mit;
  };
}
