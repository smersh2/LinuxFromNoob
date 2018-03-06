################################################################
#
################################################################
. ./config3.sh

cd $src
rm -rf llvm-5.0.1.src
tar -xvf llvm-5.0.1.src.tar.xz
cd llvm-5.0.1.src

mkdir -v build &&
cd       build &&

CC=gcc CXX=g++                              \
cmake -DCMAKE_INSTALL_PREFIX=/usr           \
      -DLLVM_ENABLE_FFI=ON                  \
      -DCMAKE_BUILD_TYPE=Release            \
      -DLLVM_BUILD_LLVM_DYLIB=ON            \
      -DLLVM_TARGETS_TO_BUILD="host;AMDGPU" \
      -Wno-dev ..                           &&
make -j$(nproc)

make install


cd $aa
