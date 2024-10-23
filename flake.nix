{
  description = "Competitive Programming Project";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";  # Keep unstable as a separate input
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, flake-utils }: flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs { inherit system; };  # Use stable nixpkgs by default
    in {
      devShell = pkgs.mkShell {
        buildInputs = [
          pkgs.gcc                # g++
          pkgs.cmake              # for building complex projects
          pkgs.just               # task runner
          pkgs.valgrind           # for stress testing/memory checks
          pkgs.gdb                # debugger
          # pkgs.perf               # performance testing
        ];
      };
    }
  );
}
