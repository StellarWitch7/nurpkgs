{ pkgs }:

with pkgs; {
  # my programs/libraries
  vault = callPackage ./vault { };
  easy-nixos = callPackage ./easy-nixos { };
  git-nixed = callPackage ./git-nixed { };

  # programs/libraries by other people
  ImageSorter = callPackage ./ImageSorter { };
  localtonet = callPackage ./localtonet { };
  playit = callPackage ./playit { inherit (pkgs) rust-bin; };

  # games
  bar = callPackage ./bar { };
}
