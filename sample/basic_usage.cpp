
#include "pcg_random.hpp"

int main()
{
    pcg32 rng(42);
    return rng() + rng();
}
