# How to parse text file with dplp-env image:
# 1- Prepare docker container (run just once)
#   - change directory to DPLP root path
#   - run a container:    docker run --rm -it -v ./:/home/DPLP -w /home/DPLP matsepahi/dplp-env sleep infinitely
#   - get containerid:    docker ps
# 2- parse text 
#   - copy .txt files to a directory wthin DPLP root (for example: data)  
#   - run parser:          docker exec -it <containerid> myparser.sh data   



# To build the content of this repo into a docker image, uncomment the following lines and use them as your docker file:

#FROM matsepahi/dplp-env
#WORKDIR /home/DPLP
#COPY . .
#COPY corenlp.sh ../corenlp/
