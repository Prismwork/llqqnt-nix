{ lib, pkgs, ... }:

with lib;

rec {
  llqqnt = import ./llqqnt.nix { inherit pkgs; };
}
