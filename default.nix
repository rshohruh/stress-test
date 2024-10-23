let
  pkgs = import <nixpkgs> {};
in
pkgs.stdenv.mkDerivation {
  name = "competitive-programming-project";
  src = ./.;
  buildInputs = [ pkgs.gcc pkgs.cmake ];

  buildPhase = ''
    mkdir -p build
    cd build
    cmake ..
    make
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp ./build/my_program $out/bin/
  '';
}
