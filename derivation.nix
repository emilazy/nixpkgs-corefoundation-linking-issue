{
  lib,
  stdenv,
  darwin,
  useAppleSdk ? false,
}:
stdenv.mkDerivation {
  name = "nixpkgs-corefoundation-linking-issue-test";

  src =
    builtins.filterSource
    (path: _: !builtins.isNull (builtins.match ".*\.(bash|c|h)" path))
    ./.;

  buildInputs = lib.optional useAppleSdk darwin.apple_sdk.frameworks.CoreFoundation;

  buildPhase = ''
    bash ./build.bash
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp build/test $out/bin/nixpkgs-corefoundation-linking-issue-test
  '';
}
