{
  callPackage,
  stdenv,
  lib,
  # Extra
  path, # Absolute path
} :
let
  fs = lib.fileset;
  quartz = callPackage ./quartz.nix {};
in
stdenv.mkDerivation {
  name = "quartz-notes";

  src = fs.toSource {
    root = path;
    # Only get markdown files, otherwise it may cause re-evaluation
    fileset = fs.fileFilter
      ({ hasExt, ... }: hasExt "md")
      path;
  };

  buildInputs = [ quartz ];

  buildPhase = ''
    mkdir $out
    mkdir $out/public
    ${quartz}/bin/quartz build --directory ./ --output $out/public
  '';
}
