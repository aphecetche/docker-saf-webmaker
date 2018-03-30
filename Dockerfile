FROM centos:6

# basic stuff 
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
    vim rh-git29 devtoolset-6 python27 boost boost-devel \
    libpng-devel yaml-cpp-devel \
    python-requests python-pip python-devel curl-devel \
    mariadb-devel \
    gcc-c++ patch readline readline-devel zlib zlib-devel \
    libyaml-devel libffi-devel openssl-devel make \
    bzip2 autoconf automake libtool bison iconv-devel sqlite-devel \
    ruby-devel gcc make rpm-build rubygems

# recent cmake, pip, alibuild and python requirements for alibuild
# and build ROOT
RUN cd /tmp && \
    curl -O https://cmake.org/files/v3.9/cmake-3.9.6.tar.gz && \
    tar -zvxf cmake-3.9.6.tar.gz && \
    cd cmake-3.9.6 && \
    ./configure && \
    make && make install && \
    source scl_source enable python27 && \
    pip install --upgrade pip && \
    pip install matplotlib numpy certifi ipython ipywidgets ipykernel notebook metakernel pyyaml alibuild && \
    mkdir -p $HOME/alice/sw && \
    cd $HOME/alice && \
    source scl_source enable python27 && \
    aliBuild init && \
    aliBuild build ROOT

# FPM (the thing that will create the RPM) depends on a decent ruby version
RUN curl -sSL https://rvm.io/mpapis.asc | gpg --import - && \
    curl -L get.rvm.io | bash -s stable && \
    source /etc/profile.d/rvm.sh && \
    rvm reload && \
    rvm requirements run && \
    rvm install 2.4.2 && \
    gem install --no-ri --no-rdoc fpm 