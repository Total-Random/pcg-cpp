cmake_minimum_required(VERSION 3.10)
project(pcg-cpp VERSION 0.9.1 LANGUAGES CXX)

include(GNUInstallDirs)
include(CMakePackageConfigHelpers)

# Header-only library
add_library(pcg-cpp INTERFACE)
add_library(pcg_cpp::pcg_cpp ALIAS pcg-cpp)

target_include_directories(pcg-cpp INTERFACE
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>
)

target_compile_features(pcg-cpp INTERFACE cxx_std_11)

# Options
option(PCG_CPP_BUILD_SAMPLES "Build samples" ON)
option(PCG_CPP_BUILD_TESTS "Build tests" ON)

if(PCG_CPP_BUILD_TESTS)
    enable_testing()
endif()

if(PCG_CPP_BUILD_SAMPLES)
    add_subdirectory(sample)
endif()

if(PCG_CPP_BUILD_TESTS)
    add_subdirectory(test-high)
endif()

# Installation
install(DIRECTORY include/ DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})

install(TARGETS pcg-cpp EXPORT pcg-cppTargets)
install(EXPORT pcg-cppTargets
    FILE pcg-cppTargets.cmake
    NAMESPACE pcg_cpp::
    DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/pcg-cpp
)

write_basic_package_version_file(
    "${CMAKE_CURRENT_BINARY_DIR}/pcg-cppConfigVersion.cmake"
    VERSION ${PROJECT_VERSION}
    COMPATIBILITY SameMajorVersion
)

configure_package_config_file(
    "${CMAKE_CURRENT_SOURCE_DIR}/cmake/pcg-cppConfig.cmake.in"
    "${CMAKE_CURRENT_BINARY_DIR}/pcg-cppConfig.cmake"
    INSTALL_DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/pcg-cpp
)

install(FILES
    "${CMAKE_CURRENT_BINARY_DIR}/pcg-cppConfig.cmake"
    "${CMAKE_CURRENT_BINARY_DIR}/pcg-cppConfigVersion.cmake"
    DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/pcg-cpp
)
