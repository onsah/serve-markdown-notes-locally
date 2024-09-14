{
  callPackage,
  stdenv,
  config,
} :
let
  quartz = callPackage ./quartz.nix {};
in
stdenv.mkDerivation {
  name = "quartz-notes";

  src = config.content;

  buildInputs = [ quartz ];

  buildPhase = ''
    mkdir $out
    mkdir $out/public
    ${quartz}/bin/quartz build --directory ./ --output $out/public
  '';
}
