{
  description = "Simple terminal count down timer";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      packages.${system}.default = pkgs.stdenv.mkDerivation {
        pname = "tiny-terminal-timer";
        version = "0.1.0";
        src = ./.;
        format = "other";

        buildPhase = ''
          gcc -O2 -Wall -Wextra -o tmr tmr.c
        '';

        installPhase = ''
          mkdir -p $out/bin
          cp tmr $out/bin/
        '';
      };

      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs;
        [
          gcc
        ];
      };
    };
}
