{
  mkShellNoCC,
  writeShellScriptBin,
  callPackage,
  git,
  caddy,
  # Additional inputs
  config,
}:

let
  quartz = callPackage ./quartz.nix {};
  serve-live = writeShellScriptBin "serve-live" ''
    ${quartz}/bin/quartz build --directory ${config.path} --serve
  '';
in mkShellNoCC {
  packages = [
    git
    caddy
    serve-live
  ];
}
