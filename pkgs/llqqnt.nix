{ stdenv, ... }:

let
  llVersion = "1.0.3";
  llSrc = builtins.fetchGit {
    url = "https://github.com/LiteLoaderQQNT/LiteLoaderQQNT";
    rev = "refs/tags/v${llVersion}";
    submodules = true;
  };
in
stdenv.mkDerivation rec {
  pname = "llqqnt";
  version = "${llVersion}";
  src = llSrc.outPath;
}