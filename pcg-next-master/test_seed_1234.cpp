#include <iostream>
#include <vector>
#include <cstdint>
#include "pcg-next/random.hpp"

using namespace std;

int main() {
    // Both C library and this C++ library default stream might differ if not specified.
    // Let's test with just seed = 1234u, and if needed, specific seq. 
    pcg32 rng(1234u, 54u); // Try with standard sequence 54 provided in samples
    pcg32 rng_default(1234u); // Default sequence

    vector<uint32_t> expected = {
        2653504168,
        209608674,
        1195720523,
        3249742110,
        76957682,
        3144134622,
        2510553852,
        2126586030,
        2110775405,
        2940631255
    };

    cout << "Testing with pcg32(1234u):" << endl;
    for (int i = 0; i < 10; ++i) {
        cout << rng_default() << endl;
    }
    
    return 0;
}
