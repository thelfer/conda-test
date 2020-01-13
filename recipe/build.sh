mkdir build
cd build

cmake "${SRC_DIR}" -G "${CMAKE_GENERATOR}"             \
      -DCMAKE_OSX_SYSROOT="${CONDA_BUILD_SYSROOT}" ../ \
      -DCMAKE_BUILD_TYPE=Release\
      -DBOOST_ROOT="${PREFIX}"\
      -DBoost_NO_SYSTEM_PATHS=ON\      
      -DBoost_USE_STATIC_LIBS=OFF\
      -DBoost_NO_BOOST_CMAKE=ON\
      -DCMAKE_INSTALL_PREFIX="${PREFIX}"

cmake --build . --target all
cmake --build . --target install
