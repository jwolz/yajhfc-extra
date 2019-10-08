#/bin/sh
# Build a JRE for Windows setup


# Path to a Linux JDK with a suitable jlink
LINUX_JDK_PATH=/data/jonas/build/jdk-11.0.2

# Path to the Windows JDK to build from
WIN_JDK_PATH=/data/jonas/build/win64-jdk-11.0.2

# Modules to include
MODULES=java.base,java.datatransfer,java.desktop,java.logging,java.management,java.naming,java.security.sasl,java.sql,java.xml,java.xml.crypto

# Output directory. Will be deleted and overwritten!
OUTDIR=/home/jonas/java/yajhfc/extra/winsetup/jre

if [ -d $OUTDIR ]; then
  echo "Deleting old $OUTDIR..."
  rm -rf "$OUTDIR"
fi

echo "Building JRE in $OUTDIR..."
export PATH=$LINUX_JDK_PATH/bin:$PATH

jlink -v --no-header-files --no-man-pages --strip-debug --compress=1 --module-path "$WIN_JDK_PATH/jmods" --add-modules "$MODULES" --output "$OUTDIR"

echo -n "JRE size: "
du -sh $OUTDIR

