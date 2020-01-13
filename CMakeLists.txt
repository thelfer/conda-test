cmake_minimum_required(VERSION 3.0)
project(conda-test)

find_package(PythonLibs REQUIRED)
message(STATUS "found python          ${PYTHONLIBS_VERSION_STRING}")
message(STATUS "python include path   ${PYTHON_INCLUDE_DIRS}")

set(CXXFLAGS "")

string(REGEX REPLACE "[a-z]+.*$" "" PYTHONLIBS_VERSION_CLEANED ${PYTHONLIBS_VERSION_STRING})
find_package(PythonInterp ${PYTHONLIBS_VERSION_CLEANED} REQUIRED)
find_package(Boost 1.36.0 COMPONENTS "python")

message(STATUS "Boost include dir: ${Boost_INCLUDE_DIRS}")
message(STATUS "Boost library dir: ${Boost_LIBRARY_DIRS}")

include_directories("${Boost_INCLUDE_DIRS}")
include_directories("${PYTHON_INCLUDE_DIRS}")
add_executable(conda-test main)
target_link_libraries(conda-test
  ${Boost_PYTHON_LIBRARY} ${PYTHON_LIBRARIES})

