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
    rev = "6fd3d6373f9a700ed901f2de82950e22f993bd45";
    hash = "sha256-8VHighIus2spB1IgQiW6EiZNAhjW1YlcUj/vwEcUUVI=";
  };
in
callPackage "${quartz-nix}/quartz.nix" { content = config.content; }
