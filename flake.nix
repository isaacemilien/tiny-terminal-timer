{
  description = "Simple terminal count down timer";

  inputs.nixpkgs.url = "nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs, ...}:

  let 
    forAllSystems = f:
    nixpkgs.lib.genAttrs [ "x86_64-linux" ] (system: f { pkgs = import nixpkgs { inherit system; }; inherit system; }
    );
  in {
    packages = forAllSystems ({ pkgs, system }:
      {
        default = pkgs.stdenv.mkDerivation {
          pname = "tiny-terminal-timer";
          version = "0.1.0";

          src = self;

          buidlInputs = [ pkgs.python3 ];

          installPhase = ''
            mkdir -p $out/bin
            cp tmr.py $out/bin/tiny-terminal-timer
            chmod +x $out/bin/tiny-terminal-timer
          '';
        };
      }
    );
  };
}
