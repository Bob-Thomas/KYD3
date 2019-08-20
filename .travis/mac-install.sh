#!/usr/bin/env bash
#
# Copyright (c) 2018 The Bitcoin Core developers
# Distributed under the MIT software license, see the accompanying
# file COPYING or http://www.opensource.org/licenses/mit-license.php.

export LC_ALL=C.UTF-8
PROD=$(softwareupdate -l |
 grep "\*.*Command Line.*$(sw_vers -productVersion|awk -F. '{print $1"."$2}')" |
 head -n 1 | awk -F"*" '{print $2}' |
 sed -e 's/^ *//' |
 tr -d '\n')
brew uninstall --force --ignore-dependencies openssl autoconf fontconfig gdbm boost@1.57 glib harfbuzz jpeg libffi libtiff pixman python@2 sqlite automake freetype gdk-pixbuf gmp icu4c libcroco libpng libtool pango pkg-config qt watch berkeley-db@4 cairo fribidi gettext graphite2 iperf libevent librsvg miniupnpc pcre protobuf readline || exit 1
brew update
brew cleanup -s
brew install autoconf fontconfig gdbm openssl@1.0 boost@1.57 glib harfbuzz jpeg libffi libtiff pixman python@2 sqlite automake freetype gdk-pixbuf gmp icu4c libcroco libpng libtool pango pkg-config qt watch berkeley-db@4 cairo fribidi gettext graphite2 iperf libevent librsvg miniupnpc pcre protobuf readline
brew link --overwrite --force boost@1.57