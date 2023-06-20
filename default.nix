{
  pkgs ? import <nixpkgs> {},
  useAppleSdk ? false,
}:
pkgs.callPackage ./derivation.nix {inherit useAppleSdk;}
