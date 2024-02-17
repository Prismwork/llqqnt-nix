{ pkgs, llqqnt, ... }:

pkgs.qq.overrideAttrs (oldAttrs: {
  pname = "qq-llqqnt";
  version = "${oldAttrs.version}+llqqnt.${llqqnt.version}";

  postInstall = ''
    sed -i "1i\\
    require(\"${llqqnt}");\\
    require('./launcher.node').load('external_index', module);" "$out/opt/QQ/resources/app/app_launcher/index.js"
  '';
})
