{ lib, stdenvNoCC, unzip, source }:

stdenvNoCC.mkDerivation {
  inherit (source) pname version src;

  nativeBuildInputs = [ unzip ];

  # Prevents stdenv from attempting to cd into an extracted subfolder
  sourceRoot = ".";

  # Keep prebuilt signature intact (no shebang rewriting).
  dontFixup = true;

  installPhase = ''
    runHook preInstall

    mkdir -p "$out/Applications"
    cp -R "Sol.app" "$out/Applications/"

    runHook postInstall
  '';

  meta = with lib; {
    description = "Open source macOS launcher";
    homepage = "https://github.com/ospfranco/sol";
    platforms = platforms.darwin;
  };
}
