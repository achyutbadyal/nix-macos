{ lib, stdenvNoCC, _7zz, source }:

stdenvNoCC.mkDerivation {
  inherit (source) pname version src;

  nativeBuildInputs = [ _7zz ];
  sourceRoot = ".";

  # Prebuilt .app: patchShebangs rewrites Chromium's install.sh and
  # breaks the Developer ID / notarized signature → Gatekeeper "damaged".
  dontFixup = true;

  installPhase = ''
    runHook preInstall

    mkdir -p "$out/Applications"
    cp -R "Ardia.app" "$out/Applications/"

    runHook postInstall
  '';

  meta = with lib; {
    description = "Browser inspired by the death of Arc, and the rise of Dia.";
    homepage = "https://github.com/mantrakp04/ardia";
    license = licenses.gpl3;
    platforms = platforms.darwin;
  };
}
