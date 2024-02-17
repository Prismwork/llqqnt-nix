{ pkgs, ... }:

rec {
  llqqnt = import ./llqqnt.nix;
  qq-llqqnt = import ./qq-llqqnt.nix { inherit pkgs llqqnt; };
}
