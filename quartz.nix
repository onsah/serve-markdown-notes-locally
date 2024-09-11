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
    rev = "e5414366f7b28a114d278ed2df016d5072dc7f26";
    hash = "sha256-PAP1TjNOTbbgW0M2U+QOwc/1sMYltG4iyjhKTLRrukI=";
  };
in
callPackage "${quartz-nix}/quartz.nix" { content = config.content; }
