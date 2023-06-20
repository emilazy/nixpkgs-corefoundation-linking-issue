{
  inputs = {
    nixpkgs-2023-06-18.url = "github:NixOS/nixpkgs/a7e89343414dcb3f635ea0d0dcc9311668600ead";
    nixpkgs-2023-06-17.url = "github:NixOS/nixpkgs/2c09e8eb8717e240ef9c5727c1cc9186db9fb309";
    nixpkgs-21-05.url = "github:NixOS/nixpkgs/nixpkgs-21.05-darwin";
  };

  outputs = inputs: {
    packages =
      inputs.nixpkgs-2023-06-18.lib.genAttrs [
        "x86_64-darwin"
        "aarch64-darwin"
      ] (platform: let
        package = nixpkgs: settings:
          import ./. ({pkgs = nixpkgs.legacyPackages.${platform};} // settings);
      in {
        crash = package inputs.nixpkgs-2023-06-18 {};
        correct-apple-sdk = package inputs.nixpkgs-2023-06-18 {useAppleSdk = true;};
        incorrect-recent = package inputs.nixpkgs-2023-06-17 {};
        incorrect-old = package inputs.nixpkgs-21-05 {};
      });
  };
}
