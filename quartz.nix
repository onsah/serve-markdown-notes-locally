{
  callPackage,
  fetchFromGitHub,
} :
let
  quartz-src = fetchFromGitHub {
    owner = "onsah";
    repo = "quartz-nix";
    rev = "d765bb9763bdafdbf45996628aa306f95c17e8cf";
    hash = "sha256-QrvmcG65T3ahGNHa/9CL2/VX4r2poCyltTWeC1nykEw=";
  };
in
callPackage "${quartz-src}/quartz.nix" {}
