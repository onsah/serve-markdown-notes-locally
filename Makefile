build-notes:
	nix-build -A quartz-notes

serve: build-notes
	caddy run --config Caddyfile

serve-live:
	quartz build --directory ../Notes/Public --serve
