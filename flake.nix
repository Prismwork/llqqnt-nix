{
  description = "LLQQNT Flake";
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-unstable;
    flake-utils.url = github:numtide/flake-utils;
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachSystem [ "x86_64-linux" "aarch64-linux" ] (system:
      let
        pkgs = import nixpkgs { inherit system; };
        llSrc = builtins.fetchGit {
          url = "https://github.com/LiteLoaderQQNT/LiteLoaderQQNT";
          submodules = true;
        };
        qqPkg = pkgs.qq;
        llqqntPkg = pkgs.qq.overrideAttrs (oldAttrs: {
          postInstall = ''
            mkdir $out/opt/QQ/resources/app/LiteLoader
            cp -r ${llSrc.outPath}/* $out/opt/QQ/resources/app/LiteLoader
            sed -i 's/"main": ".\/app_launcher\/index.js"/"main": ".\/LiteLoader"/' $out/opt/QQ/resources/app/package.json
          '';
        });
      in {
        packages = rec {
          qq = qqPkg;
          llqqnt = llqqntPkg;
          default = llqqnt;
        };
      }
    );
}
