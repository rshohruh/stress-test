# Run the stress test script
stress-test:
    chmod +x src/stress.sh
    ./src/stress.sh
    rm src/brute
    rm src/gen
    rm src/main

# Compile and run the program
run name:
    g++ -o src/{{name}} -DLOCAL src/{{name}}.cpp
    ./src/{{name}} < src/input.txt > src/output.txt 2> src/error.txt
    rm src/{{name}}

# Generate new problem based on template.cpp
new name:
    cp src/template.cpp src/{{name}}.cpp
    echo "Created new problem: src/{{name}}.cpp"
    code src/{{name}}.cpp
