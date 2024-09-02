# Serve Markdown Notes Locally
Serve markdown notes as a website locally.

## Setup
1. Clone this repo
2. Create `config.nix` file:
```nix
{ lib }:
{
  content = ./path/to/content;
}
```

## Usage
To launch the website, run `make serve`.
