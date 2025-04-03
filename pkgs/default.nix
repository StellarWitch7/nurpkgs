{ pkgs }:

with pkgs; rec {
  # my programs/libraries
  vault = callPackage ./vault { };
  easy-nixos = callPackage ./easy-nixos { };
  git-nixed = callPackage ./git-nixed { };
  dont-repeat-yourself = callPackage ./dont-repeat-yourself { };
  clickr = callPackage ./clickr { };
  i3lock-blurred = callPackage ./i3lock-blurred { };

  # programs/libraries by other people
  ImageSorter = callPackage ./ImageSorter { };
  i3-video-wallpaper = callPackage ./i3-video-wallpaper { };

  # element
  element-web-unwrapped = callPackage ./element-web-unwrapped/package.nix { };
  element-web = callPackage ./element-web/package.nix { inherit element-web-unwrapped; };
  element-desktop = callPackage ./element-desktop/package.nix { inherit element-web; };

  # games
  bar = callPackage ./bar { };
  EternalModManager = callPackage ./EternalModManager { };
}
