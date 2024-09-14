{
  mkShellNoCC,
  writeShellScriptBin,
  callPackage,
  git,
  caddy,
  # Additional inputs
  path, # relative path to notes
}:

let
  quartz = callPackage ./quartz.nix {};
  serve-live = writeShellScriptBin "serve-live" ''
    ${quartz}/bin/quartz build --directory ${path} --serve
  '';
in mkShellNoCC {
  packages = [
    git
    caddy
    serve-live
  ];
}
