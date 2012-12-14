#!/bin/sh
# Usage: makedistribution [-all|-jar|-deb|-rpm|-mac|-win] [outputdir]

set -e

EXTRADIR=~/java/yajhfc/extra
WORKSPACE=~/java/workspace
OUTPUT=~/java/yajhfc/temp/betas
OWNSUBDIR=1
TARGETS=""

for OPT in $* ; do
  case $OPT in
    -all|-jar|-deb|-rpm|-mac|-win)
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
ISSFILE=setup4.iss
FOPISSFILE=setup-fop.iss

read YAJVER YAJVERDOT FOPVER FOPVERDOT  <<EOF
$(perl -lne 'if ($_ =~/public static final String AppVersion = "(.*?)";/) { $Ver=$1; $Ver=~tr/./_/; printf("%s %s ", $Ver, $1);}' $WORKSPACE/yajhfc/src/yajhfc/Utils.java $WORKSPACE/FOPPlugin/src/yajhfc/faxcover/fop/EntryPoint.java )

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

 echo "Copying files to output..."
 cp $WORKSPACE/yajhfc/build/yajhfc.jar $OUTPUT/yajhfc-$YAJVER.jar
 cp $WORKSPACE/yajhfc/build/yajhfc-src.zip $OUTPUT/yajhfc-$YAJVER-src.zip
 cp $WORKSPACE/FOPPlugin/build/FOPPlugin.zip $OUTPUT/yajhfc-$YAJVER-FOPPlugin-$FOPVER.zip
 cp $WORKSPACE/FOPPlugin/build/FOPPlugin-src.zip $OUTPUT/FOPPlugin-$FOPVER-src.zip
 cp $WORKSPACE/yajhfc-console/build/yajhfc-console.zip $OUTPUT/yajhfc-console-$YAJVER.zip
 cp $WORKSPACE/yajhfc-console/build/yajhfc-console-src.zip $OUTPUT/yajhfc-console-$YAJVER-src.zip
 cp $WORKSPACE/yajhfc-pdf-plugin/build/yajhfc-pdf-plugin-src.zip $OUTPUT/yajhfc-pdf-plugin-$YAJVER-src.zip
 cp $WORKSPACE/yajhfc-pdf-plugin/build/yajhfc-pdf-plugin.zip $OUTPUT/yajhfc-pdf-plugin-$YAJVER.zip

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
 windowsify -i utf-8 -o utf-8 $READMES 

 echo "Building YajHFC setup..."
 eval $ISCC /dVERSION=$YAJVERDOT /dFOPVersion=$FOPVERDOT $ISSFILE
 echo "Building YajHFC with FOPPlugin setup..."
 #eval $ISCC /dVERSION=$YAJVERDOT /dFOPVersion=$FOPVERDOT /dWITHFOP $ISSFILE
 eval $ISCC /dVERSION=$YAJVERDOT /dFOPVersion=$FOPVERDOT /dWITHFOP $FOPISSFILE

 echo "Copying files to output..."
 cp $EXTRADIR/winsetup/Output/setup.exe $OUTPUT/yajhfc-$YAJVER-setup.exe
 cp $EXTRADIR/winsetup/Output/Setup-FOPPlugin.exe $OUTPUT/yajhfc-$YAJVER-FOPPlugin-$FOPVER-setup.exe
fi

if [ $1 == all -o $1 == deb ]; then 
 echo "Creating .deb package..."
 cd $EXTRADIR/linux-pkg/deb
 ./makepackage.sh $YAJVERDOT "" "$OUTPUT"
fi

if [ $1 == all -o $1 == mac ]; then 
 echo "Creating MAC app..."
 cd $EXTRADIR/mac-app
 ./make-macapp.sh $YAJVERDOT "$OUTPUT"
fi

if [ $1 == all -o $1 == rpm ]; then 
 echo "Creating RPM package..."
 cd $EXTRADIR/linux-pkg/rpm
 ./makepackage.sh $YAJVERDOT
 ./invoke-chroot.sh "$OUTPUT"
fi

}

(
 for TARGET in $TARGETS ; do
   build $TARGET 2>&1
 done
) | tee build.log
