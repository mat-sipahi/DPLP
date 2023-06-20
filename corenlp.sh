#!/usr/bin/bash
#
# Runs Stanford CoreNLP.
# Simple uses for xml and plain text output to files are:
#    ./corenlp.sh -file filename
#    ./corenlp.sh -file filename -outputFormat text 

scriptdir=`dirname $0`

#echo java -mx3g -cp \"$scriptdir/*\" edu.stanford.nlp.pipeline.StanfordCoreNLP $*

#$1 - path

FPATH=$1
for FNAME in $FPATH/*.txt
do
    /usr/bin/java -mx2g -cp "$scriptdir/*" edu.stanford.nlp.pipeline.StanfordCoreNLP -annotators tokenize,ssplit,pos,lemma,ner,parse -ssplit.eolonly -tokenize.whitespace true -file $FNAME  -outputFormat xml
    # /usr/bin/java -mx2g -cp "$scriptdir/*" edu.stanford.nlp.pipeline.StanfordCoreNLP -annotators tokenize,ssplit,pos,lemma,ner,parse -file $FNAME
    /bin/mv $(/usr/bin/basename $FNAME.xml) $FPATH/
done
