// debug.hpp

#ifndef DEBUG_HPP
#define DEBUG_HPP

#include <iostream>
#include <vector>
#include <string>
#include <utility>
#include <map>
#include <set>
#include <unordered_map>
#include <unordered_set>

// General-purpose printing function for different types
inline void print(int x) { std::cerr << x; }
inline void print(long x) { std::cerr << x; }
inline void print(long long x) { std::cerr << x; }
inline void print(unsigned x) { std::cerr << x; }
inline void print(unsigned long x) { std::cerr << x; }
inline void print(unsigned long long x) { std::cerr << x; }
inline void print(float x) { std::cerr << x; }
inline void print(double x) { std::cerr << x; }
inline void print(long double x) { std::cerr << x; }
inline void print(char x) { std::cerr << '\'' << x << '\''; }
inline void print(const char *x) { std::cerr << '\"' << x << '\"'; }
inline void print(const std::string &x) { std::cerr << '\"' << x << '\"'; }
inline void print(bool x) { std::cerr << (x ? "true" : "false"); }

// Print function for pairs (e.g., std::pair)
template <typename T1, typename T2>
inline void print(const std::pair<T1, T2> &p) {
    std::cerr << '{'; 
    print(p.first); 
    std::cerr << ','; 
    print(p.second); 
    std::cerr << '}';
}

// Print function for containers (e.g., std::vector, std::set)
template <typename Container>
inline void print(const Container &c) {
    int count = 0;
    std::cerr << '{';
    for (const auto &elem : c) {
        if (count++) std::cerr << ", ";  // Add comma after first element
        print(elem);
    }
    std::cerr << '}';
}

// Base case function for variadic template (when no arguments remain)
inline void printEnd() { std::cerr << "]\n"; }


// Base case for variadic template recursion (no arguments)
inline void printMultiple() { }  // Empty base case function

// Variadic template to print multiple arguments
template <typename T, typename... Args>
inline void printMultiple(T first, Args... rest) {
    print(first);
    if (sizeof...(rest)) std::cerr << ", ";
    printMultiple(rest...);
}

// Debug macro for printing variable names and values
#define debug(args...) std::cerr << "[" << #args << "] = ["; printMultiple(args); printEnd();

#endif // DEBUG_HPP
