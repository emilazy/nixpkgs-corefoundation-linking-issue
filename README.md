This is a simple test case to reproduce [NixOS/nixpkgs#238791].
The flake provides several packages:

[NixOS/nixpkgs#238791]: https://github.com/NixOS/nixpkgs/issues/238791

* `correct-apple-sdk`:
  Uses `darwin.apple_sdk.frameworks.CoreFoundation`
  instead of the default (on `x86_64-darwin`) `swift-corefoundation`;
  behaves correctly.

* `crash`:
  Crashes with a `dyld` error due to an rpath issue.
  Not directly relevant to the bug.
  The out-of-the-box behaviour with nixpkgs master as of 2023-06-18.

* `incorrect-recent`:
  Silently uses the incorrect `uuid_generate` symbol.
  The out-of-the-box behaviour with nixpkgs master as of 2023-06-17.

* `incorrect-old`:
  The same behaviour as `incorrect-recent`
  but with the 21.05 stable branch.

You can use `./test.bash` to compare these packages
with the system toolchain's correct result.
On Apple Silicon you will probably want to use Rosetta 2
as the system CoreFoundation is used unconditionally,
although I don't know if the bug even reproduces under Rosetta or not.
