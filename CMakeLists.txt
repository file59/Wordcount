cmake_minimum_required(VERSION 3.12)
project(wordcount)

if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release)
endif()

set(CMAKE_CXX_FLAGS "-Wall -Wextra")
set(CMAKE_CXX_FLAGS_DEBUG "-g")
set(CMAKE_CXX_FLAGS_RELEASE "-O3")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++14 -pthread")
set(CMAKE_CXX_STANDARD 14)

set(Boost_USE_STATIC_LIBS        ON) # only find static libs
set(Boost_USE_MULTITHREADED      ON)
set(Boost_USE_STATIC_RUNTIME    OFF)

if(Boost_FOUND)
  include_directories(${Boost_INCLUDE_DIRS})
  add_definitions( "-DHAS_BOOST" )
endif()

find_package(Boost REQUIRED COMPONENTS program_options regex)

include_directories(${CMAKE_SOURCE_DIR}/lib)

file(GLOB wordcount_SRC
      "*.hpp"
      "*.cpp"
)

add_executable(wordcount ${wordcount_SRC})
target_link_libraries(wordcount ${Boost_LIBRARIES})