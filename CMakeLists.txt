cmake_minimum_required(VERSION 3.3)

# https://semver.org/
project(PatterningCode VERSION 1.0.0)
set (CMAKE_CXX_STANDARD 11)

### Options


### End of Options

set(PATTERNING_SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/src")
set(PATTERNING_DEPENDENCIES_DIR "${CMAKE_CURRENT_SOURCE_DIR}/dependencies")

### Create an executable target patterning_code

add_executable(patterning_code)

# Add source and header files to luna
target_sources(patterning_code
    PRIVATE
    "${PATTERNING_SOURCE_DIR}/main.cpp"
)

target_include_directories(patterning_code
    PUBLIC
    "${CMAKE_CURRENT_SOURCE_DIR}/include"
    PRIVATE
)

### End of patterning_code

### Dependencies
# lunaR
option(OP_LunaRTests "Create LunaR test files" OFF)
add_subdirectory("${CMAKE_SOURCE_DIR}/dependencies/lunaR")

target_link_libraries(patterning_code
    PUBLIC
    luna
)

### End of Dependencies