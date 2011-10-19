#!/bin/bash

set -e

WORKSPACE=~/java/workspace

makepack() {
  OUT=$OUTDIR/yajhfc_$1.zip
  
  rm -f $OUT
  cd $WORKSPACE
  
  # file locations:
  LOCREADME=yajhfc/README_$1.txt
  README=yajhfc/README.txt 

  LOCFAQ=yajhfc/doc/faq-src/faq_$1.tex 
  FAQ=yajhfc/doc/faq-src/faq.tex

  FOPMSG=FOPPlugin/i18n/FOPMessages.po
  LOCFOPMSG=FOPPlugin/i18n/FOPMessages_$1.po

  CONSMSG=yajhfc-console/i18n/Messages.po
  LOCCONSMSG=yajhfc-console/i18n/Messages_$1.po

  CMDLINEOPTS=yajhfc/src/yajhfc/i18n/CommandLineOpts.po
  LOCCMDLINEOPTS=yajhfc/src/yajhfc/i18n/CommandLineOpts_$1.po

  FILES="yajhfc/src/yajhfc/i18n/messages_$1.po"

  if [ "$INCLCMDLINEOPTS" = "y" -a -f $LOCCMDLINEOPTS ]; then
     FILES="$FILES $LOCCMDLINEOPTS"
  fi

  if [ "$INCLREADME" = "y" -a  -f $LOCREADME ]; then
     FILES="$FILES $README $LOCREADME"
  fi

  if [ "$INCLFOPMSG" = "y" -a -f $LOCFOPMSG ]; then
     FILES="$FILES $LOCFOPMSG"
  fi

  if [ "$INCLFAQ" = "y" -a -f $LOCFAQ ]; then
     FILES="$FILES $FAQ $LOCFAQ yajhfc/doc/faq-src/faq.pdf yajhfc/doc/faq-src/faq_$1.pdf"
  fi

  zip -j $OUT $FILES

  if [ "$INCLCONSMSG" = "y" -a -f $LOCCONSMSG ]; then
     if [ ! -d $OUTDIR/console ]; then
       mkdir $OUTDIR/console
     fi
     
     cp $LOCCONSMSG $OUTDIR/console
     pushd $OUTDIR > /dev/null
     zip $OUT console/`basename $LOCCONSMSG` 
     popd > /dev/null
  fi

  echo "Output has been written to $OUT"
}

read -p 'Include FAQ? [y/n]' INCLFAQ
read -p 'Include CommandLineOpts? [y/n]' INCLCMDLINEOPTS
read -p 'Include README? [y/n]' INCLREADME
read -p 'Include FOP Msg? [y/n]' INCLFOPMSG
read -p 'Include Console Msg? [y/n]' INCLCONSMSG
read -p 'Upload stuff? [y/n]' UPLOADSTUFF

OUTDIR=/tmp/yajhfc-trans

if [ ! -d $OUTDIR ]; then
	mkdir -p $OUTDIR
fi

for PO in $WORKSPACE/yajhfc/src/yajhfc/i18n/messages_*.po ; do
        LANG=${PO##*messages_}
        LANG=${LANG%.po}
	
	echo "Creating Pack for language $LANG..."
	makepack $LANG
done

if [ "$UPLOADSTUFF" = "y" ]; then
	cd $OUTDIR

	echo "Uploading..."
	UPLOADPATH=/html/yajhfc/files/temp/translations
	lftp -c "open ftp://web406@srv7.sysproserver.de/$UPLOADPATH ; mput yajhfc_*.zip"
	#scp yajhfc_*.zip jwolz@shell.berlios.de:/home/groups/ftp$UPLOADPATH/
	
	echo "Uploaded the following files:"
	for ZIP in yajhfc_*.zip ; do
	   #echo ftp://ftp.berlios.de$UPLOADPATH/$ZIP
	   echo http://files.yajhfc.de/temp/translations/$ZIP
	done
fi

