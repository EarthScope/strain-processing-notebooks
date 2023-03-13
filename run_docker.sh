#! /bin/bash

echo "Resetting docker"
echo *--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*
echo "Stop / Remove strain-processing-notebooks container - command"
echo *--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*
docker stop strain-processing-notebooks-container
docker rm strain-processing-notebooks-container

#echo *--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*
#echo "Remove strain-processing-notebooks image, image that made strain-processing-notebooks-container"
#echo *--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*
#docker image rm strain-processing-notebooks_development
#
#echo *--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*
#echo "ReBuild strain-processing-notebooks image in current directory"
#echo *--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*
#docker build --rm --no-cache -t strain-processing-notebooks .
##--no-cache

echo *--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*
echo "docker run strain-processing-notebooks_docker container"
echo "Interactive, on port 8888, name = strain-processing-notebooks "
echo *--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*

# Open jupyter notebook directly
docker run \
        -it \
        -p 8888:8888 \
        --name='strain-processing-notebooks-container' \
 	      -v ${PWD}/notebooks:/home/jovyan/notebooks \
        strain-processing-notebooks

echo *--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*

