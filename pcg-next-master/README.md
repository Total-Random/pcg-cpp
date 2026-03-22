# pcg-next: Modern PCG Random Number Generation

[![Maintenance Status](https://img.shields.io/badge/status-active-brightgreen.svg)](https://github.com/Total-Random/pcg-next)
[![CI](https://github.com/Total-Random/pcg-next/actions/workflows/ci.yml/badge.svg)](https://github.com/Total-Random/pcg-next/actions/workflows/ci.yml)
[![License](https://img.shields.io/badge/license-MIT%2FApache--2.0-blue.svg)](https://opensource.org/licenses/MIT)
[![Version](https://img.shields.io/badge/version-1.1-blue.svg)](CMakeLists.txt)

[PCG-Random website]: http://www.pcg-random.org

**pcg-next** is the modernized, forward-looking branch of the PCG C++ library, hosted by the **Total-Random** organization.

## Why pcg-next?

This project is a fork of [Total-Random/pcg-cpp](https://github.com/Total-Random/pcg-cpp).

The main `pcg-cpp` branch is dedicated to maintaining strict compatibility with the original repository by Melissa O'Neill (`imneme/pcg-cpp`). This constraint prevents us from making large-scale improvements to the directory structure or naming conventions.

**pcg-next** was created to break those chains. It is where we implement:

- **Namespaced Headers**: Cleanly organized under `pcg-next/` to avoid naming collisions.
- **Simplified Naming**: Removal of redundant prefixes (e.g., `pcg_random.hpp` ⮕ `random.hpp`).
- **Modern Standards**: Faster adoption of modern C++ features and build system improvements.

### Key Improvements Integrated:

- **Windows ARM64 Support**: Integrated native support for MSVC on ARM64 architectures (Surface Pro, Apple Silicon via VM, etc.) using `__umulh` intrinsics.
- **Improved MSVC Compatibility**: Fixed ambiguous operator errors (`C2678`) in `set_stream` and `operator>>`.
- **Optimized `unxorshift`**: Integrated an optimized version of the inverse xorshift operation for better performance.
- **Consistent Typing**: Unified integer type handling across different platforms to avoid compiler warnings and errors.

Detailed information about integrated community fixes and contributors can be found in [CREDITS.md](CREDITS.md).

## About PCG

PCG is a family of simple fast space-efficient statistically good algorithms for random number generation. Unlike many common generators, it's not just "good enough" — it passes the most stringent statistical tests while being faster and smaller than most alternatives.

For full details on the theory and performance, visit the [PCG-Random website].

## Usage

This is a **header-only** library. To use it, simply add the `include` directory to your project's include path and:

```cpp
#include "pcg-next/random.hpp"

// Standard 32-bit PCG generator
pcg32 rng;

// Seed it (optional, uses a fixed seed by default)
rng.seed(pcg_extras::seed_seq_from<std::random_device>{});

// Generate a number
uint32_t x = rng();
```

- Use `pcg32` for 32-bit output.
- Use `pcg64` for 64-bit output (now highly optimized for 64-bit systems and ARM64).

## Building Demos & Tests

While the library itself is header-only, we provide tests and samples:

### Unix-style (Linux, macOS, MinGW)

```bash
make
make test
```

### Modern CMake (All Platforms)

This is the recommended way to build and integrate the library:

```bash
cmake -S . -B build
cmake --build build
cd build
ctest .
```

### Windows (MSVC)

This fork is specifically patched to support building with Visual Studio 2019/2022. You can use the CMake instructions above to generate a Visual Studio solution, or simply include the headers directly in your project.

## Directory Structure

- `include/` — The core library (header-only).
- `sample/` — Readable examples showing how to use the high-level API.
- `test-high/` — Functional and statistical tests.
- `cmake/` — Build system configuration and modules.

## Maintenance & Contributions

We welcome bug fixes and compatibility patches. If you find an issue, especially on newer hardware or compiler versions, please open an issue or pull request in the [Total-Random/pcg-cpp](https://github.com/Total-Random/pcg-cpp) repository.

## License

This code is distributed under the **Apache License, Version 2.0** or the **MIT License**, at your option. See the header of each file for details.

---

_Maintained with ❤️ by the Total-Random Team._
