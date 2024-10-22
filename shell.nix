{ pkgs ? import <nixpkgs> { } }:
let
  getLibFolder = pkg: "${pkg}/lib";
in
pkgs.mkShell {
  name = "cpp-dev-shell";

  # Tools you need for C++ development
  nativeBuildInputs = with pkgs; [
    gcc
    clang-tools
    nixd
  ];

  shellHook = ''
    # Compile and run C++ files easily using 'run <name>'
    run() {
      local srcFile="$1.cpp"
      local outputFile="$1"

      echo "Compiling $srcFile..."
      g++ "$srcFile" -o "$outputFile"

      if [[ $? -eq 0 ]]; then
        echo "Compilation successful! Running $outputFile..."
        time ./"$outputFile"
      else
        echo "Compilation failed!"
      fi
    }

    # stress testing
    stress() {
        g++ gen.cpp -o gen
        g++ brute.cpp -o brute
        g++ main.cpp -o main
        echo "Compilation completed."

        # Initialize iteration counter
        local i=1

        echo "Starting stress tests..."

        # Run stress test in a loop
        while true; do
            # Use the current iteration value as a seed
            local SEED=$i

            # Generate a test case with the current seed and save it to input.txt
            ./gen $SEED > input.txt

            # Run the brute-force solution and save output to dummy.txt
            ./brute < input.txt > dummy.txt

            # Run the optimized solution and save output to output.txt
            ./main < input.txt > output.txt

            # Compare the outputs of brute and optimized solutions
            if ! diff -q -I '^$' dummy.txt output.txt > /dev/null; then
                echo "Test case failed on iteration $i"
                echo "Input: $(cat input.txt)"
                echo "Brute output: $(cat dummy.txt)"
                echo "Optimized output: $(cat output.txt)"
                return 1
            fi

            # Print a message for each passed test case
            echo "Test case #$i ok"

            # Increment iteration counter
            ((i++))
        done

        echo "All test cases passed successfully!"
    }

    export -f run
  '';
}
