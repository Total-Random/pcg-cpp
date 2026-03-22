# Credits and Attributions

This modernized fork of `pcg-cpp` by **Total-Random** integrates several critical fixes and improvements from the community. Below is a list of changes and their original sources.

---

## Community Fixes

### 1. Optimized `unxorshift`

- **Origin:** [imneme/pcg-cpp PR #82](https://github.com/imneme/pcg-cpp/pull/82)
- **Author:** [LRFLEW](https://github.com/LRFLEW)
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

- **Author:** [brt-v](https://github.com/brt-v)
- **Description:** Simplified header includes in sample programs and added `basic_usage.cpp` sample.

---

## Total-Random Improvements

### 7. Modern CMake Build System

- **Author:** [JkarVN](https://github.com/JkarVN)
- **Description:** Comprehensive CMake integration with automated testing via `ctest`.

### 8. MSVC Compatibility Fixes

- **Author:** [JkarVN](https://github.com/JkarVN)
- **Description:** Resolved several MSVC-specific issues (C2678, C4458, C1090, C4127).

### 9. Modern C++ Best Practices

- **Author:** [Antigravity AI](https://github.com/google-deepmind)
- **Description:**
  - Implementation of `PCG_NODISCARD` and modernize using `using` syntax.

### 10. C++20 Bit Infrastructure Integration

- **Author:** **Aki Kuri** ([@akikurichan](https://github.com/akikurichan))
- **Description:**
  - Integration of C++20 `<bit>` header support for `rotl`, `rotr`, `flog2`, and `trailingzeros`.
  - Introduction of the `PCG_USE_BIT_HEADER` macro toggle for explicit bit operation control.
  - Merged from pcg-next

---

## Special Thanks

- **Melissa O'Neill** for the original PCG library.
- **Ben Haller** ([bhaller](https://github.com/bhaller)) for early support.
- **Robert Roessler** ([robertroessler](https://github.com/robertroessler)) for suggesting C++20 bit functions, implemented by **Aki Kuri**.
