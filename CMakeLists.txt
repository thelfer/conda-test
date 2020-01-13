# Remove when CMake >= 2.8.4 is required
set(CMAKE_LEGACY_CYGWIN_WIN32 0) 
project(conda-test)

find_package(PythonLibs REQUIRED)
get_filename_component(PYTHON_LIBRARY_PATH ${PYTHON_LIBRARIES} PATH)
get_filename_component(PYTHON_LIBRARY_FULL ${PYTHON_LIBRARIES} NAME)
string(REGEX REPLACE "lib(.+)\\.(.+)$" "\\1" PYTHON_LIBRARY ${PYTHON_LIBRARY_FULL})
message(STATUS "found python          ${PYTHONLIBS_VERSION_STRING}")
message(STATUS "python include path   ${PYTHON_INCLUDE_DIRS}")
message(STATUS "python libraries path ${PYTHON_LIBRARY_PATH}")
message(STATUS "python library        ${PYTHON_LIBRARY}")
string(REGEX REPLACE "[a-z]+.*$" "" PYTHONLIBS_VERSION_CLEANED ${PYTHONLIBS_VERSION_STRING})
find_package(PythonInterp ${PYTHONLIBS_VERSION_CLEANED} REQUIRED)
message(STATUS "python interpreter    ${PYTHON_EXECUTABLE}")

find_package(Boost 1.36.0 COMPONENTS "python")

message(STATUS "Boost include dir: ${Boost_INCLUDE_DIRS}")
message(STATUS "Boost library dir: ${Boost_LIBRARY_DIRS}")
