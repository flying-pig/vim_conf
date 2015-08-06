vim_conf
========
my vim configure


use vundle manage vim plugins    
```git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim```    
YouCompleteMe Install https://github.com/Valloric/YouCompleteMe

system: redhat fedora

yum install cmake

yum install clang

CentOS must first install epel [epel zh](https://fedoraproject.org/wiki/EPEL/zh-cn), download [epel release repository](http://mirrors.opencas.cn/epel/7/x86_64/e/epel-release-7-5.noarch.rpm)
rpm -i epel-release-7-5.noarch.rpm

yum install boost-devel

yum install python-devel

Note: install others you need

if you complie llvm yourself, can use    
`./configure --prefix=/usr/local/llvm --enable-optimized --enable-targets=host-only`

`cmake -G "Unix Makefiles" -DUSE_SYSTEM_LIBCLANG=ON 
-DUSE_SYSTEM_BOOST=ON . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp`

`cmake -G "Unix Makefiles" -DUSE_SYSTEM_BOOST=ON -DPATH_TO_LLVM_ROOT=/usr/local/llvm . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp`

`make ycm_support_libs`

