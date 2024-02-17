{ pkgs, ... }:

let
  llSrc = builtins.fetchGit {
    url = "https://github.com/LiteLoaderQQNT/LiteLoaderQQNT";
    rev = "7cd4b41f88d606cb2134ea2b23d9ce31dc3242f7";
    submodules = true;
  };
in
pkgs.qq.overrideAttrs (oldAttrs: {
  pname = "llqqnt";

  postInstall = ''
    sed -i "1s|^|require("${llSrc.outPath}");\n|" "$out/opt/QQ/resources/app/app_launcher/index.js"
  '';
})