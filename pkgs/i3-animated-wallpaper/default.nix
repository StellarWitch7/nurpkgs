{ stdenv
, fetchFromGitHub
, writeShellApplication
, imagemagick
, feh }:

let
  src = fetchFromGitHub {
    owner = "StellarWitch7";
    repo = "i3-animated-background";
    rev = "833ba818aac09df384b49179f0930c6a6f8b42e2";
    hash = "sha256-Opyc3GkXhFXJDEcMyrW2EkfCpK3jf3TAOEwHGLHWuzg=";
  };
  generate = writeShellApplication {
    name = "generate";
    runtimeInputs = [ imagemagick ];
    text = builtins.readFile (src + /scripts/generate_pngs.sh);
  };
  loop = writeShellApplication {
    name = "loop";
    runtimeInputs = [ feh ];
    text = builtins.readFile (src + /scripts/loop_pngs.sh);
  };
in stdenv.mkDerivation {
  pname = "i3-animated-background";
  version = "1.0.0";

  src = ./.;

  installPhase = ''
    mkdir -p $out/bin
    ln -s ${generate.out}/bin/generate $out/bin/i3-wp-generate
    ln -s ${loop.out}/bin/loop $out/bin/i3-wp-loop
  '';
}
