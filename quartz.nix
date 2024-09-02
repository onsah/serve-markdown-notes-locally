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
    rev = "52508932a4f36635ba0a809249f52d43a2421dfd";
    hash = "sha256-OsLuZAsKVZMeh3Fu5uW+GuWQupwj49Fhhn0/DrRQZm0=";
  };
in
callPackage "${quartz-nix}/quartz.nix" { content = config.content; }
