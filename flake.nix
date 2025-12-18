{
  description = "Simple terminal count down timer";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      packages.${system}.default = pkgs.python3Packages.buildPythonApplication {
        pname = "playlist-select";
        version = "0.1.0";
        src = ./.;
        format = "other";

        installPhase = ''
          mkdir -p $out/bin
          cp tmr.py $out/bin/tmr
          chmod +x $out/bin/tmr
        '';
      };
    };
}
