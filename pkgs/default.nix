{ pkgs, ... }:

rec {
  llqqnt = import ./llqqnt.nix { inherit pkgs; };
}
