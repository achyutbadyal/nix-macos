{ lib, stdenvNoCC, _7zz, source }:

stdenvNoCC.mkDerivation {
  inherit (source) pname version src;

  # Tinycast ships an APFS DMG; undmg only supports HFS.
  nativeBuildInputs = [ _7zz ];
  sourceRoot = ".";

  installPhase = ''
    runHook preInstall

    mkdir -p "$out/Applications"
    cp -R "Tinycast.app" "$out/Applications/"

    runHook postInstall
  '';

  meta = with lib; {
    description = "A tiny, fully native macOS launcher.";
    homepage = "https://github.com/abue-ammar/tinycast";
    license = licenses.agpl3;
    platforms = platforms.darwin;
  };
}
