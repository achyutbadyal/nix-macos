# pkgs/default.nix
final: prev:

let
  lib = prev.lib;
  sources = prev.callPackage ../_sources/generated.nix {};
  # List all files in ./pkgs
  dirContents = builtins.readDir ./.;
  # Filter for all .nix files except default.nix
  packageFiles = lib.filterAttrs (name: type:
    type == "regular" 
    && lib.hasSuffix ".nix" name 
    && name != "default.nix"
  ) dirContents;
in
# Map each file to an attribute
lib.mapAttrs' (fileName: _:
  let
    pkgName = lib.removeSuffix ".nix" fileName;
  in
  lib.nameValuePair pkgName (prev.callPackage (./. + "/${fileName}") {
    source = sources.${pkgName};
  })
) packageFiles
