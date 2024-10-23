# Run the stress test script
stress-test:
    ./stress.sh
    rm brute
    rm gen
    rm main

# Compile and run the program
run name:
    g++ -o {{name}} -DLOCAL {{name}}.cpp
    ./{{name}} < input.txt > output.txt 2> error.txt
    rm {{name}}

# Generate new problem based on template.cpp
new name:
    cp template.cpp {{name}}.cpp
    echo "Created new problem: {{name}}.cpp"
