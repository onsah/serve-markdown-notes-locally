{
  callPackage,
  fetchFromGitHub,
  lib,
} :
let
  config = import ./config.nix { inherit lib; };
  quartz-nix = fetchFromGitHub {
    owner = "onsah";
    repo = "quartz-nix";
    rev = "3ef25c9717661521d3588f8f7402755db99d092e";
    hash = "sha256-qenP3e+loTaRfIWKDDSJh+eUKddr7caQBSiZjFtUjRk=";
  };
in
callPackage "${quartz-nix}/quartz.nix" { content = config.content; }
