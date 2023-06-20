#!/usr/bin/bash
#

DATA=$1

/home/corenlp/corenlp.sh $DATA

python2 convert.py $DATA
python2 segmenter.py $DATA
python2 rstparser.py $DATA
