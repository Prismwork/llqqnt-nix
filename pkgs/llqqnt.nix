{ lib, pkgs, ... }:

with lib;

let
  llSrc = builtins.fetchGit {
    url = "https://github.com/LiteLoaderQQNT/LiteLoaderQQNT";
    submodules = true;
  };
in
pkgs.qq.overrideAttrs (oldAttrs: {
  pname = "llqqnt";

  postInstall = ''
    mkdir $out/opt/QQ/resources/app/LiteLoader
    cp -r ${llSrc.outPath}/* $out/opt/QQ/resources/app/LiteLoader
    sed -i 's/"main": ".\/app_launcher\/index.js"/"main": ".\/LiteLoader"/' $out/opt/QQ/resources/app/package.json
  '';
})
