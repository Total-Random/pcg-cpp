#!/bin/sh
# 
# PCG Random Number Generation for C.
# 
# Copyright 2014-2017 Melissa O'Neill <oneill@pcg-random.org>,
#                     and the PCG Project contributors.
#
# SPDX-License-Identifier: (Apache-2.0 OR MIT)
#
# Licensed under the Apache License, Version 2.0 (provided in
# LICENSE-APACHE.txt and at http://www.apache.org/licenses/LICENSE-2.0)
# or under the MIT license (provided in LICENSE-MIT.txt and at
# http://opensource.org/licenses/MIT), at your option. This file may not
# be copied, modified, or distributed except according to those terms.
#
# Distributed on an "AS IS" BASIS, WITHOUT WARRANTY OF ANY KIND, either
# express or implied.  See your chosen license for details.
#
# For additional information about the PCG random number generation scheme,
# visit http://www.pcg-random.org/.
#
# Determine where the executables are (standard Makefile behavior)
BASEDIR=$(dirname "$0")
cd "$BASEDIR"

BINDIR="."

# Function to run a test, handling potential .exe extension
run_test() {
    TEST_NAME=$1
    if [ -f "./$TEST_NAME.exe" ]; then
        "./$TEST_NAME.exe"
    elif [ -f "./$TEST_NAME" ]; then
        "./$TEST_NAME"
    else
        echo "ERROR: $TEST_NAME not found in $PWD" >&2
        return 1
    fi
}

echo Performing a quick sanity check...

mkdir -p actual
rm -f actual/*

run_test check-pcg32 > actual/check-pcg32.out
run_test check-pcg32_oneseq > actual/check-pcg32_oneseq.out
run_test check-pcg32 > /dev/null
run_test check-pcg32_fast > actual/check-pcg32_fast.out

run_test check-pcg64 > actual/check-pcg64.out
run_test check-pcg64_oneseq > actual/check-pcg64_oneseq.out
run_test check-pcg64_unique > /dev/null
run_test check-pcg64_fast > actual/check-pcg64_fast.out

run_test check-pcg8_once_insecure > actual/check-pcg8_once_insecure.out
run_test check-pcg16_once_insecure > actual/check-pcg16_once_insecure.out
run_test check-pcg32_once_insecure > actual/check-pcg32_once_insecure.out
run_test check-pcg64_once_insecure > actual/check-pcg64_once_insecure.out
run_test check-pcg128_once_insecure > actual/check-pcg128_once_insecure.out

run_test check-pcg8_oneseq_once_insecure > actual/check-pcg8_oneseq_once_insecure.out
run_test check-pcg16_oneseq_once_insecure > actual/check-pcg16_oneseq_once_insecure.out
run_test check-pcg32_oneseq_once_insecure > actual/check-pcg32_oneseq_once_insecure.out
run_test check-pcg64_oneseq_once_insecure > actual/check-pcg64_oneseq_once_insecure.out
run_test check-pcg128_oneseq_once_insecure > actual/check-pcg128_oneseq_once_insecure.out

run_test check-pcg32_k2 > actual/check-pcg32_k2.out
run_test check-pcg32_k2_fast > actual/check-pcg32_k2_fast.out

run_test check-pcg32_k64 > actual/check-pcg32_k64.out
run_test check-pcg32_k64_oneseq > actual/check-pcg32_k64_oneseq.out
run_test check-pcg32_k64_fast > actual/check-pcg32_k64_fast.out

run_test check-pcg32_c64 > actual/check-pcg32_c64.out
run_test check-pcg32_c64_oneseq > actual/check-pcg32_c64_oneseq.out
run_test check-pcg32_c64_fast > actual/check-pcg32_c64_fast.out

run_test check-pcg64_k32 > actual/check-pcg64_k32.out
run_test check-pcg64_k32_oneseq > actual/check-pcg64_k32_oneseq.out
run_test check-pcg64_k32_fast > actual/check-pcg64_k32_fast.out

run_test check-pcg64_c32 > actual/check-pcg64_c32.out
run_test check-pcg64_c32_oneseq > actual/check-pcg64_c32_oneseq.out
run_test check-pcg64_c32_fast > actual/check-pcg64_c32_fast.out

run_test check-pcg32_k1024 > actual/check-pcg32_k1024.out
run_test check-pcg32_k1024_fast > actual/check-pcg32_k1024_fast.out

run_test check-pcg32_c1024 > actual/check-pcg32_c1024.out
run_test check-pcg32_c1024_fast > actual/check-pcg32_c1024_fast.out

run_test check-pcg64_k1024 > actual/check-pcg64_k1024.out
run_test check-pcg64_k1024_fast > actual/check-pcg64_k1024_fast.out

run_test check-pcg64_c1024 > actual/check-pcg64_c1024.out
run_test check-pcg64_c1024_fast > actual/check-pcg64_c1024_fast.out

run_test check-pcg32_k16384 > actual/check-pcg32_k16384.out
run_test check-pcg32_k16384_fast > actual/check-pcg32_k16384_fast.out

find actual -type f -size -80c -delete

if diff -ru -x .gitignore expected actual
then
    echo All tests succeeded.
else
    echo ''
    if diff -x "*-pcg64_[ck]*.out" \
            -x "*-pcg128_[ck]*.out" -ru expected actual > /dev/null
    then
        echo All tests except tests awkward tests with 128-bit math succceed.
    else
        echo ERROR: Some tests failed.
    fi
fi
