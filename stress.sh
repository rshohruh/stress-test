#!/run/current-system/sw/bin/bash

#  ____   ___    _   _  ___ _____   _____ ____ ___ _____
# |  _ \ / _ \  | \ | |/ _ \_   _| | ____|  _ \_ _|_   _|
# | | | | | | | |  \| | | | || |   |  _| | | | | |  | |
# | |_| | |_| | | |\  | |_| || |   | |___| |_| | |  | |
# |____/ \___/  |_| \_|\___/ |_|   |_____|____/___| |_|


# Compile all the necessary files
g++ gen.cpp -o gen
g++ brute.cpp -o brute
g++ main.cpp -o main

# Initialize iteration counter
i=1

# Run stress test in a loop
while true; do
    # Use the current iteration value as a seed
    SEED=$i

    # Generate a test case with the current seed and save it to input.txt
    ./gen $SEED > input.txt

    # Run the brute-force solution and save output to dummy.txt
    ./brute < input.txt > dummy.txt

    # Run the optimized solution and save output to output.txt
    ./main < input.txt > output.txt

    # Compare the outputs of brute and optimized solutions
    if ! diff -q dummy.txt output.txt > /dev/null; then
        echo "Test case failed on iteration $i"
        echo "Input: $(cat input.txt)"
        echo "Brute output: $(cat dummy.txt)"
        echo "Optimized output: $(cat output.txt)"
        exit 1
    fi

    # Print a message for each passed test case
    echo "Test case #$i ok"

    # Increment iteration counter
    ((i++))
done

echo "All test cases passed successfully!"
