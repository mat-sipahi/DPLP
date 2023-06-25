# RST Parser #

## 1. Required Package ##

scipy, numpy, sklearn, nltk, python-tk 

The last two packages are required to draw the RST tree structure in the PostScript format. It is highly recommended to install these two packages for visualization. Otherwise, you have to read the bracketing results and to imagine what the tree looks like :-)

## 2. RST Parsing with Raw Documents ##

To do RST parsing on raw documents, you will need syntactic parses and also the discourse segmentations on the documents. Let's start with preparing data

First, we need to collect all the documents into one folder, as all the following commands will scan this folder and process the documents in the same way. Let's assume the directory is **./data**

All the following commands will be run in a batch fasion, which means every command will scan will the documents in the data folder and process them once.

### 2.1 Data Processing ###

1. Run the Stanford CoreNLP with the given bash script **corenlp.sh** with the command "*./corenlp.sh path_to_dplp/data*"
    - This is a little awkward, as I am not sure how to call the Stanford parser from any other directory.

2. Convert the XML file into CoNLL-like format with command "*python convert.py ./data*"
    - Now, we can come back to the DPLP folder to run this command

### 2.2 Segmentation and Parsing ###

1. Segment each document into EDUs with command "*python segmenter ./data*"

2. Finally, run RST parser with command "*python rstparser ./data*"
    - The RST parser will generate the bracketing file for each document, which can be used for evaluation
    - It will also generate the PostScript file of the RST structure. Generating (and saving) these PS files will slow down the parsing procedure a little. You can turn it off with "*python rstparser ./data* False"


## 3. Training Your Own RST Parser ##

TODO

## 4. Run with docker

You can use docker image `matsepahi/dplp-env` to run DPLP code. It contains all required softwares and packages preinstalled. 
It is recommended to run the code by creatng a volume in the docker container, mapped to your local copy of DPLP code.
The best volume path is `/home/` where `corenlp` is installed. You can use these commands:

1. Prepare docker container (run just once)
  - change directory to DPLP root path
  - run a container:    docker run --rm -it -v ./:/home/DPLP -w /home/DPLP matsepahi/dplp-env sleep infinitely
  - get containerid:    docker ps
2. parse text 
  - copy .txt files to a directory wthin DPLP root (for example: data)  
  - run parser:          docker exec -it [containerid] ./myparser.sh data   



## Reference ##

Please read the following paper for more technical details

Yangfeng Ji, Jacob Eisenstein. *[Representation Learning for Text-level Discourse Parsing](http://jiyfeng.github.io/papers/ji-acl-2014.pdf)*. ACL 2014