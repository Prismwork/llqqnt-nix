{
  description = "LLQQNT Flake";
  inputs = {
    nixpkgs = {
      url = github:NixOS/nixpkgs/nixos-unstable;
      inputs.allowUnfree = true;
    };
    flake-utils.url = github:numtide/flake-utils;
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachSystem [ "x86_64-linux" "aarch64-linux" ] (system:
      let
        pkgs = import nixpkgs { inherit system; };
        
        pkgsLocal = import ./pkgs { inherit pkgs; };
      in {
        packages = rec {
          llqqnt = pkgsLocal.llqqnt;
          default = llqqnt;
        };
      }
    );
}
