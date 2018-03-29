FROM centos:6

RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm && \
    yum install -y centos-release-scl && \
    yum update -y && \
    yum install -y git gettext-devel \
    make wget which gcc gcc-c++ libtool automake autoconf zip \
    exinfo bison flex openssl-devel \
    libxml2-devel swig perl-ExtUtils-Embed \
    environment-modules \
    libX11-devel mesa-libGLU-devel libXpm-devel libXft-devel \
    gcc-gfortran bzip2 bzip2-devel python-pip tmux screen \
    ncurses-devel texinfo python-devel \
    xorg-x11-fonts-Type1 \
    vim rh-git29 cmake3 devtoolset-6 python27

RUN cd /tmp && wget https://root.cern.ch/download/root_v6.12.06.source.tar.gz && tar -zvxf root_v6.12.06.source.tar.gz

RUN cd /tmp && mkdir build && cd build && source scl_source enable devtoolset-6 python27 && cmake3 ../root-6.12.06 && make install 