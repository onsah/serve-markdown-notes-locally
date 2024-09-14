{
  system ? builtins.currentSystem,
  sources ? import ./npins,
}:
let
  pkgs = import sources.nixpkgs { inherit system; };
  config = import ./config.nix;
in
{
  quartz-notes = pkgs.callPackage ./nix/quartz-notes.nix {
    path = ./. + "/${config.path}";
  };
  shell = pkgs.callPackage ./nix/shell.nix {
    path = config.path;
  };
}
