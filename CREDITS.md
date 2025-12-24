# Credits and Attributions

This modernized fork of `pcg-cpp` by **Total-Random** integrates several critical fixes and improvements from the community. Below is a list of changes and their original sources.

## Community Fixes

### 1. Optimized `unxorshift`
- **Origin:** [imneme/pcg-cpp PR #82](https://github.com/imneme/pcg-cpp/pull/82)
- **Author:** [melak47](https://github.com/melak47)
- **Description:** Implements a more efficient inverse xorshift operation.

### 2. Empty Base Class Optimization (EBCO) for MSVC
- **Origin:** [imneme/pcg-cpp PR #66](https://github.com/imneme/pcg-cpp/pull/66)
- **Author:** [melak47](https://github.com/melak47)
- **Description:** Enables `__declspec(empty_bases)` on MSVC to optimize the memory footprint of RNG objects.

### 3. Public `result_type` in `seed_seq_from`
- **Origin:** [imneme/pcg-cpp PR #83](https://github.com/imneme/pcg-cpp/pull/83)
- **Author:** [timo-eichhorn](https://github.com/timo-eichhorn)
- **Description:** Makes `result_type` public to comply with the C++ `SeedSequence` concept.

### 4. GCC Warning Fixes
- **Origin:** [SupercriticalSynthesizers/pcg-cpp PR fix-gcc-warnings](https://github.com/SupercriticalSynthesizers/pcg-cpp/tree/fix-gcc-warnings)
- **Author:** [Timo Alho](https://github.com/tialho)
- **Description:** Resolves various GCC warnings (clz/ctz truncation) when building with `-Wall`.

### 5. Native Windows ARM64 Support
- **Origin:** [imneme/pcg-cpp PR #99](https://github.com/imneme/pcg-cpp/pull/99)
- **Author:** [Demonese](https://github.com/Demonese)
- **Description:** Added native support for ARM64 on MSVC using `__umulh` for efficient 128-bit multiplication.

### 6. Sample and Include Cleanups
- **Origin:** [imneme/pcg-cpp commit be22608](https://github.com/imneme/pcg-cpp/commit/be22608ebcbe3aa0606600975705e2820600ed4e)
- **Author:** [brt-v](https://github.com/brt-v)
- **Description:** Simplified header includes in sample programs and added `basic_usage.cpp` sample.
### 7. Consistent Integer Type
- **Origin:** [imneme/pcg-cpp PR #92](https://github.com/imneme/pcg-cpp/pull/92)
- **Author:** [rstub](https://github.com/rstub)
- **Description:** Fixes compilation issues where `__uint128` isn't available by ensuring consistent type usage.

### 8. Modern C++ Standard Usage in Samples
- **Suggestion:** [david-fong](https://github.com/david-fong)
- **Description:** Replaced C-style casting and `std::round` with `std::lround` in `cppref-sample.cpp`.

## Total-Random Improvements

### 9. Modern CMake Build System
- **Author:** [Total-Random](https://github.com/Total-Random)
- **Description:** Comprehensive CMake integration with `find_package` support and automated testing via `ctest`.

### 10. MSVC Compatibility Fixes
- **Author:** [Total-Random](https://github.com/Total-Random)
- **Description:** Resolved several MSVC-specific issues:
  - `C2678` (ambiguous operator) in `set_stream` and `operator>>`.
  - `C4458` (declaration of 'is_mcg' hides class member).
  - `C1090` (PDB API call failed) during parallel builds.
  - `C4127` (conditional expression is constant) in template code.

## Special Thanks
Special thanks to **Melissa O'Neill** for creating the original PCG library and to all the community members who have proposed fixes over the years.

We are especially grateful to:
- **Ben Haller** ([bhaller](https://github.com/bhaller)) for his early support, encouragement, and understanding during the initial phases of this fork.
- **david-fong** ([david-fong](https://github.com/david-fong)) for valuable feedback on the CMake build system.
