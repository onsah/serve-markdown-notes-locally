build:
	nix-build

serve: build
	caddy run --config Caddyfile
