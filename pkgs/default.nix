{ pkgs }:

with pkgs; {
  # my programs/libraries
  vault = callPackage ./vault { };
  easy-nixos = callPackage ./easy-nixos { };
  git-nixed = callPackage ./git-nixed { };
  dont-repeat-yourself = callPackage ./dont-repeat-yourself { };

  # programs/libraries by other people
  ImageSorter = callPackage ./ImageSorter { };
  localtonet = callPackage ./localtonet { };
  playit = callPackage ./playit { };
  i3-animated-wallpaper = callPackage ./i3-animated-wallpaper { };

  # games
  bar = callPackage ./bar { };
}
