cmake_minimum_required(VERSION 3.0.0)
project(bop VERSION 0.1.0)

include(CTest)
enable_testing()

add_executable(bop main.cpp)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})

set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -fsanitize=address")

if (${CMAKE_BUILD_TYPE} STREQUAL ASAN)
    message(STATUS "ASAN DETECTED:")
    message(STATUS "${CMAKE_CXX_FLAGS_DEBUG}")
    set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -fsanitize=address")
endif()

include(CPack)
