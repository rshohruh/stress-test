# C++ Stress Testing Framework

This project is a stress testing framework designed to validate the correctness of algorithms by comparing the outputs of a brute-force solution against an optimized solution. It automatically generates test cases and runs both solutions to ensure they produce the same results.

## Components

The project consists of the following files:

- `gen.cpp`: A program that generates random test cases based on a given seed and range.
- `brute.cpp`: A brute-force solution that provides a straightforward implementation to solve the problem.
- `main.cpp`: An optimized solution that is intended to be more efficient than the brute-force method.
- `stress.sh`: A shell script that compiles the C++ files, generates test cases, runs both solutions, and checks for discrepancies.
- `input.txt`: A file where the generated test cases are stored temporarily.
- `dummy.txt`: A file that stores the output of the brute-force solution.
- `output.txt`: A file that stores the output of the optimized solution.

## Requirements

To compile and run this project, you need:

- A C++ compiler (e.g., g++)
- Bash (for running the stress script)

## Installation

1. Clone this repository:
   ```bash
   git clone "https://github.com/rshohruh/stress-test.git"
   cd stress-test
2. Ensure you have the required dependencies installed. If you're using g++, it should already be available on most systems.

## Usage
1. Complete the `gen.cpp`, `brute.cpp` and `main.cpp` files
2. Make the `stres.sh` executable
```
chmod +x stress.sh
```
3. Run the stress testing script:

```
./stress.sh
```
4. The script will generate test cases and run both solutions in an infinite loop, comparing their outputs. It will stop and report any discrepancies, including the input that caused the failure and the outputs from both solutions.

## Contributing
If you would like to contribute to this project, please feel free to fork the repository and submit a pull request. Any improvements or additional features are welcome!

## License

This repository is licensed under the MIT License. See the [LICENSE](./LICENSE) file for more information.


## Acknowledgements
- The framework uses the Mersenne Twister algorithm for random number generation.
- Special thanks to the C++ Standard Library for its utilities and functionality.
