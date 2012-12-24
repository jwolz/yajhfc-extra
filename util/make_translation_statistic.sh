#!/bin/sh

OUTFILE=/tmp/translation_statistic.html

cd `dirname $0`
cd ../postatistic

POSTAT_PY=`pwd`/postat.py

cd ~/java/workspace
python $POSTAT_PY > $OUTFILE

echo "Wrote output to $OUTFILE"



