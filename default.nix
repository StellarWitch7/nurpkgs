# This file describes your repository contents.
# It should return a set of nix derivations
# and optionally the special attributes `lib`, `modules` and `overlays`.
# It should NOT import <nixpkgs>. Instead, you should take pkgs as an argument.
# Having pkgs default to <nixpkgs> is fine though, and it lets you use short
# commands such as:
#     nix-build -A mypackage

{ pkgs ? import <nixpkgs> { } }:

with pkgs; {
  # the `lib`, `modules`, and `overlays` names are special
  lib = import ./lib { inherit pkgs; }; # functions
  modules = import ./modules; # NixOS modules
  overlays = import ./overlays; # nixpkgs overlays

  # my programs/libraries
  moth-lang = callPackage ./pkgs/moth-lang { };
  vault = callPackage ./pkgs/vault { };
  nixbrains = callPackage ./pkgs/nixbrains { };
  easy-nixos = callPackage ./pkgs/easy-nixos { };
  git-nixed = callPackage ./pkgs/git-nixed { };

  # programs/libraries by other people
  ImageSorter = callPackage ./pkgs/ImageSorter { };
  localtonet = callPackage ./pkgs/localtonet { };
  playit = callPackage ./pkgs/playit { };
}
