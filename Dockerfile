FROM ubuntu:16.04
MAINTAINER GISCE-TI, S.L. <devel@gisce.net>

# install Python and all the mapnik dependencies
RUN apt-get update -y

# symlink the native extensions so Python can pick them up
RUN ln -s /usr/lib/x86_64-linux-gnu/libjpeg.so /usr/lib
RUN ln -s /usr/lib/x86_64-linux-gnu/libz.so /usr/lib
RUN ln -s /usr/lib/x86_64-linux-gnu/libboost_python.so /usr/lib
RUN ln -s /usr/lib/x86_64-linux-gnu/libboost_thread.so /usr/lib

RUN apt-get install -y git devscripts clang-3.8 libstdc++-4.9-dev debhelper
RUN apt-get install -y libboost-thread-dev libboost-filesystem-dev libboost-regex-dev
RUN apt-get install -y libboost-system-dev libboost-program-options-dev libpng-dev libjpeg-dev libtiff-dev
RUN apt-get install -y zlib1g-dev libcurl4-gnutls-dev  libsqlite3-dev libcairo2-dev python-cairo
RUN apt-get install -y libwebp-dev libharfbuzz-dev libpq-dev libproj-dev libgdal1-dev libxml2-dev
RUN apt-get install -y python zlib1g-dev clang make pkg-config python-all-dev
RUN apt-get install -y scons libtool libicu-dev libfreetype6-dev libcairo-dev libgdal-dev
