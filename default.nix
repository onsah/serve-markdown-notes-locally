{
  system ? builtins.currentSystem,
  sources ? import ./npins,
}:
let
  pkgs = import sources.nixpkgs { inherit system; };
  config = pkgs.callPackage ./config.nix {};
in
{
  quartz-notes = pkgs.callPackage ./nix/quartz-notes.nix {
    inherit config;
  };
  shell = pkgs.callPackage ./nix/shell.nix {
    inherit config;
  };
}
