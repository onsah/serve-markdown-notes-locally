{
  system ? builtins.currentSystem,
  sources ? import ./npins,
}:
let
  pkgs = import sources.nixpkgs { inherit system; };
  config = pkgs.callPackage ./config.nix {};
  quartz-notes = pkgs.callPackage ./quartz-notes.nix {
    inherit config;
  };
  quartz = pkgs.callPackage ./quartz.nix {};
  serve-live = pkgs.writeShellScriptBin "serve-live" ''
    ${quartz}/bin/quartz build --directory ${config.content} --serve
  '';
in
{
  inherit quartz-notes;
  shell = pkgs.mkShellNoCC {
    packages = [
      pkgs.git
      pkgs.caddy
      quartz
      serve-live
    ];
  };
}
