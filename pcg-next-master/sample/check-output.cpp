#include <iostream>
#include <iomanip>
#include "pcg-next/random.hpp"

int main() {
    pcg32 rng(42u); // Seed with 42
    std::cout << "First 10 random numbers from pcg32(42):" << std::endl;
    for(int i=0; i<10; ++i) {
        std::cout << std::setw(12) << rng() << ((i+1)%5 == 0 ? "\n" : " ");
    }
    return 0;
}
