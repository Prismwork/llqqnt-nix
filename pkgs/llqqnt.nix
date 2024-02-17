{ stdenv, ... }:

stdenv.mkDerivation rec {
  pname = "llqqnt";
  version = "1.0.3";
  src = builtins.fetchGit {
    url = "https://github.com/LiteLoaderQQNT/LiteLoaderQQNT";
    rev = "refs/tags/v${version}";
    submodules = true;
  };
}