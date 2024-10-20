{ stdenv
, fetchFromGitHub
, writeShellApplication
, imagemagick
, feh }:

let
  src = fetchFromGitHub {
    owner = "StellarWitch7";
    repo = "i3-animated-background";
    rev = "d136e24dd273ce1e9240aa609443c98621cfaa46";
    hash = "sha256-Ibszx9DtNZFkGAmmnt/aEox/3W14Rm5HtBoYMTqD+6I=";
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
  version = "1.0.1";

  src = ./.;

  installPhase = ''
    mkdir -p $out/bin
    ln -s ${generate.out}/bin/generate $out/bin/i3-wp-generate
    ln -s ${loop.out}/bin/loop $out/bin/i3-wp-loop
  '';
}
