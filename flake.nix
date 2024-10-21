{
  description = "A simple C++ project with automated compile and run";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";  # You can adjust this to your preferred Nixpkgs version
  };

  outputs = { self, nixpkgs }: {
    devShells = {
      default = nixpkgs.mkShell {
        buildInputs = [ nixpkgs.gcc ];  # Provides g++ compiler

        shellHook = ''
          echo "Welcome to the C++ project development environment!"
          echo "Use 'run <name>' to compile and run a C++ file (e.g., run main for main.cpp)"

          # Create a function to automate compile and run without file existence checks
          run() {
            local srcFile="$1.cpp"
            local outputFile="$1"

            echo "Compiling $srcFile..."
            g++ "$srcFile" -o "$outputFile"

            if [[ $? -eq 0 ]]; then
              echo "Compilation successful! Running $outputFile..."
              ./"$outputFile"
            else
              echo "Compilation failed!"
            fi
          }

          export -f run
        '';
      };
    };
  };
}
