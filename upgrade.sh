#!/bin/sh
cd /usr/local/etc
pkg update
pkg upgrade -y
sa-update -D
pkg autoremove
pkg clean -a
# pkg check -Bdsr
