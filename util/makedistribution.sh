#!/bin/bash
# Usage: makedistribution [-all|-jar|-deb|-rpm|-mac|-win] [outputdir]

set -e

EXTRADIR=~/java/yajhfc/extra
WORKSPACE=~/java/workspace
OUTPUT=~/java/yajhfc/temp/betas
OWNSUBDIR=1
TARGETS=""

for OPT in $* ; do
  case $OPT in
    -all|-jar|-deb|-rpm|-mac|-win|-man)
      TARGETS="$TARGETS ${OPT#-}"
    ;;
    -*)
     echo "Unknown option $OPT"
     exit 1
    ;;
    *)
     OUTPUT=$OPT
     OWNSUBDIR=0
    ;;
  esac
done

if [ -z "$TARGETS" ]; then
  TARGETS=all
fi

build() {
ANT=ant
ISCC="wine \"C:\Program Files\Inno Setup 5\ISCC\""
ISSFILE=setup6.iss
FOPISSFILE=setup-fop.iss
WINDOWSIFY="java -cp $WORKSPACE/jtools/bin windowsify.Windowsify"

read YAJVER YAJVERDOT FOPVER FOPVERDOT  <<EOF
$(perl -lne 'if ($_ =~/public static final String AppVersion = "(.*?)";/) { $Ver=$1; $Ver=~tr/./_/; printf("%s %s ", $Ver, $1);}' $WORKSPACE/yajhfc/src/yajhfc/VersionInfo.java $WORKSPACE/FOPPlugin/src/yajhfc/faxcover/fop/EntryPoint.java )

EOF

echo "Building distribution for:"
echo "YajHFC Version: $YAJVERDOT (Tag: $YAJVER); FOP Plugin version: $FOPVERDOT (Tag: $FOPVER)"
echo

if [ $OWNSUBDIR -ne 0 ]; then
  OUTPUT=$OUTPUT/$YAJVERDOT
  mkdir -p $OUTPUT
fi

if [ $1 == all -o $1 == jar ]; then 
 echo "Building YajHFC..."
 cd $WORKSPACE/yajhfc
 $ANT -Dyajhfc.version=$YAJVERDOT clean fulldist
 echo "Building FOPPlugin..."
 cd $WORKSPACE/FOPPlugin
 $ANT -Dyajhfc.version=$YAJVERDOT clean fulldist
 echo "Building yajhfc-console..."
 cd $WORKSPACE/yajhfc-console
 $ANT -Dyajhfc.version=$YAJVERDOT clean fulldist
 echo "Building yajhfc-pdf-plugin..."
 cd $WORKSPACE/yajhfc-pdf-plugin
 $ANT -Dyajhfc.version=$YAJVERDOT clean fulldist
 echo "Building yajhfc-plugin-mail..."
 cd $WORKSPACE/yajhfc-plugin-mail
 $ANT -Dyajhfc.version=$YAJVERDOT clean fulldist
 echo "Building yajhfc-plugin-libtiff..."
 cd $WORKSPACE/yajhfc-plugin-libtiff
 $ANT -Dyajhfc.version=$YAJVERDOT clean fulldist

 echo "Copying files to output..."
 cp $WORKSPACE/yajhfc/build/yajhfc.jar $OUTPUT/yajhfc-$YAJVER.jar
 cp $WORKSPACE/yajhfc/build/yajhfc-src.zip $OUTPUT/yajhfc-$YAJVER-src.zip
 cp $WORKSPACE/FOPPlugin/build/FOPPlugin.zip $OUTPUT/yajhfc-$YAJVER-FOPPlugin-$FOPVER.zip
 cp $WORKSPACE/FOPPlugin/build/FOPPlugin-src.zip $OUTPUT/FOPPlugin-$FOPVER-src.zip
 cp $WORKSPACE/yajhfc-console/build/yajhfc-console.zip $OUTPUT/yajhfc-console-$YAJVER.zip
 cp $WORKSPACE/yajhfc-console/build/yajhfc-console-src.zip $OUTPUT/yajhfc-console-$YAJVER-src.zip
 cp $WORKSPACE/yajhfc-pdf-plugin/build/yajhfc-pdf-plugin-src.zip $OUTPUT/yajhfc-pdf-plugin-$YAJVER-src.zip
 cp $WORKSPACE/yajhfc-pdf-plugin/build/yajhfc-pdf-plugin.zip $OUTPUT/yajhfc-pdf-plugin-$YAJVER.zip
 cp $WORKSPACE/yajhfc-plugin-mail/build/yajhfc-plugin-mail-src.zip $OUTPUT/yajhfc-plugin-mail-$YAJVER-src.zip
 cp $WORKSPACE/yajhfc-plugin-mail/build/yajhfc-plugin-mail.zip $OUTPUT/yajhfc-plugin-mail-$YAJVER.zip
 cp $WORKSPACE/yajhfc-plugin-libtiff/build/yajhfc-plugin-libtiff-src.zip $OUTPUT/yajhfc-plugin-libtiff-$YAJVER-src.zip
 cp $WORKSPACE/yajhfc-plugin-libtiff/build/yajhfc-plugin-libtiff.zip $OUTPUT/yajhfc-plugin-libtiff-$YAJVER.zip


 cat <<EOF > $OUTPUT/versioninfo.xml
<?xml version="1.0"?>
<yajhfcupdatefile>
	<currentVersion>$YAJVERDOT</currentVersion>
	<releaseDate>`date +%Y-%m-%d`</releaseDate>
	<infoURL>http://www.yajhfc.de/</infoURL>
</yajhfcupdatefile>
EOF
fi

if [ $1 == all -o $1 == win ]; then 
 echo "Building Windows Setup..."
 cd $EXTRADIR/winsetup

 echo "Converting README files to Windows format..."
 READMES=""
 for R in $WORKSPACE/yajhfc/README*.txt; do
   READMES="$READMES $R temp/`basename $R`"
 done
 $WINDOWSIFY -i utf-8 -o utf-8 $READMES 

 echo "Building YajHFC setup..."
 eval $ISCC /dVERSION=$YAJVERDOT /dFOPVersion=$FOPVERDOT $ISSFILE
 echo "Building YajHFC with FOPPlugin setup..."
 #eval $ISCC /dVERSION=$YAJVERDOT /dFOPVersion=$FOPVERDOT /dWITHFOP $ISSFILE
 eval $ISCC /dVERSION=$YAJVERDOT /dFOPVersion=$FOPVERDOT /dWITHFOP $FOPISSFILE
 echo "Building YajHFC batch printer setup..."
 eval $ISCC /dVERSION=$YAJVERDOT /dFOPVersion=$FOPVERDOT setup-batchprinter.iss

 echo "Copying files to output..."
 cp $EXTRADIR/winsetup/Output/yajhfc-setup.exe $OUTPUT/yajhfc-$YAJVER-setup.exe
 cp $EXTRADIR/winsetup/Output/Setup-FOPPlugin.exe $OUTPUT/yajhfc-$YAJVER-FOPPlugin-$FOPVER-setup.exe
 cp $EXTRADIR/winsetup/Output/Setup-BatchPrinter.exe $OUTPUT/yajhfc-$YAJVER-plugin-mail-setup.exe
fi

if [ $1 == all -o $1 == deb ]; then 
 echo "Creating .deb package..."
 cd $EXTRADIR/linux-pkg/deb
 ./makepackage.sh $YAJVERDOT "" "$OUTPUT"
fi

if [ $1 == all -o $1 == mac ]; then 
 echo "Creating MAC app..."
 cd $EXTRADIR/mac-app
 #./make-macapp.sh $YAJVERDOT "$OUTPUT"
 $ANT -Dyajhfc.version=$YAJVERDOT clean macapp
 cp dist/yajhfc-macapp.zip $OUTPUT/yajhfc-macapp-$YAJVERDOT.zip
fi

if [ $1 == all -o $1 == rpm ]; then 
 echo "Creating RPM package..."
 cd $EXTRADIR/linux-pkg/rpm
 ./makepackage.sh $YAJVERDOT
 ./invoke-chroot.sh "$OUTPUT"
fi

if [ $1 == all -o $1 == man ]; then 
  echo "Creating HTML man pages..."
  LANG=C java -cp $WORKSPACE/yajhfc/build/yajhfc.jar yajhfc.Launcher --Xprint-manpage | groff -mandoc -Thtml > $OUTPUT/man-yajhfc.html
  LANG=C java -cp $WORKSPACE/yajhfc/build/yajhfc.jar:$WORKSPACE/yajhfc-console/build/yajhfc-console.jar yajhfc.console.Main --Xprint-manpage | groff -mandoc -Thtml > $OUTPUT/man-cyajhfc.html
fi

}

(
 for TARGET in $TARGETS ; do
   build $TARGET 2>&1
 done
) | tee build.log
