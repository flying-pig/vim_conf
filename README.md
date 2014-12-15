vim_conf
========
my vim configure


use vundle manage vim plugins

YouCompleteMe Install https://github.com/Valloric/YouCompleteMe

system: redhat fedora

yum install cmake

yum install clang

yum install boost-devel

yum install python-devel

Note: install others you need

if you complie llvm yourself, can use
./configure --prefix=/usr/local/llvm --enable-optimized --enable-targets=host-only

make -G "Unix Makefiles" -DUSE_SYSTEM_LIBCLANG=ON 
-DUSE_SYSTEM_BOOST=ON . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp

make ycm_support_libs

