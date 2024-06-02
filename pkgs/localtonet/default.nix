{ stdenv
, lib
, fetchurl
, autoPatchelfHook
, makeWrapper
, unzip
, libgcc
, libz
, icu
, openssl }:

stdenv.mkDerivation rec {
  pname = "localtonet";
  version = "1.0";

  src = fetchurl {
    url = "https://localtonet.com/download/localtonet-linux-x64.zip";
    hash = "sha256-AyhHwIO30422ft6YWbf+FZZflV8dFmQNKeUFaB/WXpQ=";
  };

  sourceRoot = ".";

  nativeBuildInputs = [
    autoPatchelfHook
    makeWrapper
  ];

  buildInputs = [
    unzip
    libgcc
    libz
    stdenv.cc.cc.lib
    openssl
  ];

  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin
    mv localtonet $out/localtonet
    chmod 777 $out/localtonet
    ln -s $out/localtonet $out/bin/localtonet
    wrapProgram $out/bin/localtonet --set DOTNET_SYSTEM_GLOBALIZATION_INVARIANT 1 --set LD_LIBRARY_PATH ${openssl.out}/lib
    runHook postInstall
  '';

  meta = with lib; {
    homepage = "https://localtonet.com";
    description = "IP tunneling";
    platforms = platforms.linux;
  };
}