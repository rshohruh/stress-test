{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.gcc        # g++
    pkgs.cmake      # Build tool
    pkgs.just       # Task runner for automating tasks
    pkgs.valgrind   # Memory error detector, useful for stress testing
    pkgs.gdb        # Debugger
    pkgs.perf       # For performance profiling
  ];

  shellHook = ''
    echo "Development environment for C++ Competitive Programming"
  '';
}
