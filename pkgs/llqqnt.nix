{ pkgs, ... }:

let
  llVersion = "1.0.3";
  llSrc = builtins.fetchGit {
    url = "https://github.com/LiteLoaderQQNT/LiteLoaderQQNT";
    rev = "refs/tags/v${llVersion}";
    submodules = true;
  };
in
pkgs.qq.overrideAttrs (oldAttrs: {
  pname = "llqqnt";
  version = "${oldAttrs.version}+llqqnt.${llVersion}";

  postInstall = ''
    substituteInPlace $out/opt/QQ/resources/app/app_launcher/index.js --replace 'require\(".*/launcher\.node"\)' 'require("${llSrc.outPath}");\n  require("./launcher.node")'
  '';
})