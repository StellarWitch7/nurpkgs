{ pkgs, lib, stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  name = "${pname}-${version}";
  pname = "ImageSorter";
  version = "1.2.0";

  src = fetchFromGitHub {
    owner = "htmlcoderexe";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-qBPAUQ7kTCIkLJB2tEj+XYoYdXmpGqeQ8BiVj489Ot0=";
  };

  buildInputs = with pkgs; [
    mono
    msbuild
  ];

  runtimeDeps = with pkgs; [
    mono
  ];

  buildPhase = ''
    msbuild -property:Configuration=Release
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp ImageSorter/bin/Release/ImageSorter.exe $out/bin/ImageSorter.exe
    printf "#!/usr/bin/env bash\n\n${pkgs.mono.out}/bin/mono $out/bin/ImageSorter.exe" >$out/bin/ImageSorter
    chmod -R +x $out/bin
  '';
  
  meta = with lib; {
    homepage = "https://github.com/htmlcoderexe/ImageSorter";
    description = "A GUI (Winforms) program for quickly and manually sorting images";
    license = licenses.mit;
  };
}
