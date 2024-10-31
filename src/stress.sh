# Compile all necessary files
g++ gen.cpp -o gen
g++ brute.cpp -o brute
g++ main.cpp -o main

# Initialize iteration counter
i=1

# Run stress test in a loop
while [[ $i -le 5000 ]]; do
    # Use the current iteration value as a seed
    SEED=$i

    # Generate a test case with the current seed and save it to input.txt
    ./gen $SEED > src/input.txt

    # Run the brute-force solution and save output to dummy.txt
    ./brute < src/input.txt > src/dummy.txt

    # Run the optimized solution and save output to output.txt
    ./main < src/input.txt > src/output.txt

    # Compare the outputs of brute and optimized solutions
    if ! diff -q -I '^$' src/dummy.txt src/output.txt > /dev/null; then
        echo "Test case failed on iteration $i"
        echo "Input: $(cat src/input.txt)"
        echo "Brute output: $(cat src/dummy.txt)"
        echo "Optimized output: $(cat src/output.txt)"
        exit 0
    fi

    # Print a message for each passed test case
    echo "Test case #$i ok"

    # Increment iteration counter
    ((i++))
done

echo "All test cases passed successfully!"
