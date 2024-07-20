{ stdenv
, lib
, fetchurl
, appimageTools }:

let
  version = "1.2988.0";
in appimageTools.wrapType2 {
  pname = "bar";

  inherit version;

  src = fetchurl {
    url = "https://github.com/beyond-all-reason/BYAR-Chobby/releases/download/v${version}/Beyond-All-Reason-${version}.AppImage";
    hash = "sha256-ZJW5BdxxqyrM2TJTO0SBp4BXt3ILyi77EZx73X8hqJE=";
  };

  meta = with lib; {
    homepage = "https://github.com/beyond-all-reason";
    description = "A Total Annihilation inspired RTS";
    license = licenses.gpl2;
  };
}
