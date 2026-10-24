{ lib, stdenvNoCC, undmg, source }:

stdenvNoCC.mkDerivation {
  inherit (source) pname version src;

  nativeBuildInputs = [ undmg ];
  sourceRoot = ".";

  # Keep prebuilt signature intact (no shebang rewriting).
  dontFixup = true;

  installPhase = ''
    runHook preInstall

    mkdir -p "$out/Applications"
    cp -R "PdfCraft.app" "$out/Applications/"

    runHook postInstall
  '';

  meta = with lib; {
    description = "PDF editor built in Rust";
    homepage = "https://github.com/storytold/pdfcraft";
    license = licenses.agpl3Plus;
    platforms = platforms.darwin;
  };
}
