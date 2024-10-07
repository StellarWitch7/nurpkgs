{ lib
, fetchurl
, appimageTools
, binutils
, openal
, fuse
, nss
, SDL2
, gtk3
, makeDesktopItem }:

appimageTools.wrapType2 rec {
  pname = "bar";
  version = "1.2988.0";

  src = fetchurl {
    url = "https://github.com/beyond-all-reason/BYAR-Chobby/releases/download/v${version}/Beyond-All-Reason-${version}.AppImage";
    hash = "sha256-ZJW5BdxxqyrM2TJTO0SBp4BXt3ILyi77EZx73X8hqJE=";
  };

  extraInstallCommands = let
    desktop = makeDesktopItem {
      name = pname;
      desktopName = "Beyond All Reason";
      exec = pname;
      terminal = false;
    };
  in ''
    mkdir -p $out/share/applications
    cp ${desktop}/share/applications/${pname}.desktop $out/share/applications/
  '';

  extraPkgs = pkgs: [
    binutils
    openal
    fuse
    nss
    SDL2
    gtk3
  ];

  meta = with lib; {
    homepage = "https://github.com/beyond-all-reason";
    description = "A Total Annihilation inspired RTS";
    license = licenses.gpl2;
  };
}
