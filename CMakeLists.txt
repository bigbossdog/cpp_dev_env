cmake_minimum_required(VERSION 3.0.0)
project(bop VERSION 0.1.0)

include(CTest)
enable_testing()

add_executable(bop main.cpp)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})

set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -fsanitize=address") #thread,dataflow") # thread not allowed with address

if (${CMAKE_BUILD_TYPE} STREQUAL ASAN)
    message(STATUS "ASAN DETECTED:") # by default includes -fsanitize=leak on macOS
    message(STATUS "${CMAKE_CXX_FLAGS_DEBUG}")
    set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -fsanitize=address")
endif()

if (${CMAKE_BUILD_TYPE} STREQUAL MEMSAN)
    message(STATUS "MEMSAN DETECTED")
    set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -fsanitize=memory")
endif()

if (${CMAKE_BUILD_TYPE} STREQUAL TSAN)
    message(STATUS "TSAN DETECTED")
    set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -fsanitize=thread")
endif()

if (${CMAKE_BUILD_TYPE} STREQUAL UBSAN)
    message(STATUS "UBSAN DETECTED")
    set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -fsanitize=undefined")
endif()

if (${CMAKE_BUILD_TYPE} STREQUAL DATASAN)
    message(STATUS "DATASAN DETECTED")
    set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -fsanitize=dataflow")
endif()

if (${CMAKE_BUILD_TYPE} STREQUAL CFI)
    message(STATUS "CFI DETECTED")
    set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -fsanitize=cfi -flto")
    # add_compile_options(-fsanitize=cfi)
    # add_link_options(-fsanitize=cfi)
    # add_compile_options(-flto)
    # add_link_options(-flto)
endif()


include(CPack)
