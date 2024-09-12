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
    rev = "368519d98f5ce52968188cd336185c1d744f2419";
    hash = "sha256-kK6JQirOfRNJy+RdDEMQ1CafSdgHJmd/OHLgWEy+BJY=";
  };
in
callPackage "${quartz-nix}/quartz.nix" { content = config.content; }
