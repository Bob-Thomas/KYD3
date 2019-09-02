#!/usr/bin/env bash
#
# Copyright (c) 2018 The Bitcoin Core developers
# Distributed under the MIT software license, see the accompanying
# file COPYING or http://www.opensource.org/licenses/mit-license.php.

export LC_ALL=C.UTF-8

if [[ $HOST = *-mingw32 ]]; then
 sudo update-alternatives --set $HOST-g++ $(which $HOST-g++-posix)
fi
if [ -z "$NO_DEPENDS" ]; then
  CONFIG_SHELL= make -j4 -C depends HOST=$HOST $DEP_OPTS
fi
