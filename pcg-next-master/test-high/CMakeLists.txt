set(TEST_TARGETS
    check-pcg8_once_insecure check-pcg8_oneseq_once_insecure
    check-pcg16_once_insecure check-pcg16_oneseq_once_insecure check-pcg32
    check-pcg32_c1024 check-pcg32_c1024_fast check-pcg32_c64
    check-pcg32_c64_fast check-pcg32_c64_oneseq check-pcg32_fast
    check-pcg32_k1024 check-pcg32_k1024_fast check-pcg32_k16384
    check-pcg32_k16384_fast check-pcg32_k2 check-pcg32_k2_fast
    check-pcg32_k64 check-pcg32_k64_fast check-pcg32_k64_oneseq
    check-pcg32_once_insecure check-pcg32_oneseq
    check-pcg32_oneseq_once_insecure check-pcg32_unique check-pcg64
    check-pcg64_c1024 check-pcg64_c1024_fast check-pcg64_c32
    check-pcg64_c32_fast check-pcg64_c32_oneseq check-pcg64_fast
    check-pcg64_k1024 check-pcg64_k1024_fast check-pcg64_k32
    check-pcg64_k32_fast check-pcg64_k32_oneseq check-pcg64_once_insecure
    check-pcg64_oneseq check-pcg64_oneseq_once_insecure check-pcg64_unique
    check-pcg128_once_insecure check-pcg128_oneseq_once_insecure
)


foreach(test_exe ${TEST_TARGETS})
    add_executable(${test_exe} ${test_exe}.cpp)
    target_link_libraries(${test_exe} PRIVATE pcg_cpp::pcg_cpp)
    # The tests in this project compare actual output with expected output.
    # For now, we just add them as basic regression tests.
    add_test(NAME ${test_exe} COMMAND ${test_exe})
endforeach()
