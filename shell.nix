{
  system ? builtins.currentSystem,
  sources ? import ./npins,
}:
let
  pkgs = import sources.nixpkgs { inherit system; };
in
pkgs.mkShellNoCC {

  packages = [
    pkgs.git
    pkgs.caddy
  ];

}
