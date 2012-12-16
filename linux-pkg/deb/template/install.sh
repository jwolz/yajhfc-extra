#!/bin/sh
# "Installs" YajHFC in order to create a package

if [ -z "$1" ]; then
  echo "Usage: `basename $0` targetdir"
  exit 1
fi

PREFIX="$1/usr"

mkdir -p $PREFIX/bin
install -m 0755 yajhfc $PREFIX/bin

mkdir -p $PREFIX/share/man/man1
install -m 0644 yajhfc.1 $PREFIX/share/man/man1

mkdir -p $PREFIX/share/doc/yajhfc
for FILE in doc/*; do
  install -m 0644 $FILE $PREFIX/share/doc/yajhfc
done

mkdir -p $PREFIX/share/yajhfc
install -m 0644 yajhfc.jar $PREFIX/share/yajhfc
install -m 0644 logo-large.png $PREFIX/share/yajhfc
ln -s ../java $PREFIX/share/yajhfc/lib 

mkdir -p $PREFIX/share/pixmaps
install -m 0644 yajhfc-48x48.png $PREFIX/share/pixmaps/yajhfc.png
install -m 0644 yajhfc.xpm $PREFIX/share/pixmaps/yajhfc.xpm

mkdir -p $PREFIX/share/icons/hicolor/128x128/apps
install -m 0644 logo-large.png $PREFIX/share/icons/hicolor/128x128/apps/yajhfc.png

mkdir -p $PREFIX/share/icons/hicolor/16x16/apps
install -m 0644 yajhfc-16x16.png $PREFIX/share/icons/hicolor/16x16/apps/yajhfc.png

mkdir -p $PREFIX/share/icons/hicolor/32x32/apps
install -m 0644 yajhfc-32x32.png $PREFIX/share/icons/hicolor/32x32/apps/yajhfc.png

mkdir -p $PREFIX/share/icons/hicolor/48x48/apps
install -m 0644 yajhfc-48x48.png $PREFIX/share/icons/hicolor/48x48/apps/yajhfc.png

mkdir -p $PREFIX/share/applications
install -m 0644 yajhfc.desktop $PREFIX/share/applications



