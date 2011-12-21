#!/bin/sh
# "Installs" YajHFC in order to create a package

if [ -z "$1" ]; then
  echo "Usage: `basename $0` targetdir"
  exit 1
fi

PREFIX="$1"

cd pdfplugin

mkdir -p $PREFIX/usr/share/yajhfc
install -m 0644 yajhfc-pdf-plugin.jar $PREFIX/usr/share/yajhfc

mkdir -p $PREFIX/usr/share/doc/yajhfc-pdfplugin
#install -m 0644 readme.pdf $PREFIX/usr/share/doc/yajhfc-fopplugin

mkdir -p $PREFIX/usr/share/doc/yajhfc-pdfplugin/examples
#for FILE in examples/*; do
#  if [ -f $FILE ]; then
#    install -m 0644 $FILE $PREFIX/usr/share/doc/yajhfc-fopplugin/examples
#  fi
#done


mkdir -p $PREFIX/etc/yajhfc
install -m 0644 launcher-include.pdfplugin $PREFIX/etc/yajhfc
