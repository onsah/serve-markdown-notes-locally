{
  system ? builtins.currentSystem,
  sources ? import ./npins,
}:
let
  pkgs = import sources.nixpkgs { inherit system; };
  quartz-notes = pkgs.callPackage ./quartz-notes.nix {
    config = pkgs.callPackage ./config.nix {};
  };
  quartz = pkgs.callPackage ./quartz.nix {};
in
{
  inherit quartz-notes;
  shell = pkgs.mkShellNoCC {
    packages = [
      pkgs.git
      pkgs.caddy
      quartz
    ];
  };
}
