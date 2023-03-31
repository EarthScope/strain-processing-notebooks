#! /bin/bash

echo "Resetting docker"
echo *--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*
echo "Stop / Remove strain-processing-notebooks container - command"
echo *--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*
docker stop strain-processing-notebooks
docker rm strain-processing-notebooks

echo *--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*
echo "docker run strain-processing-notebooks_docker container"
echo "Interactive, on port 8888, name = strain-processing-notebooks "
echo *--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*

# Open jupyter notebook directly
docker run \
        -it \
        -p 8888:8888 \
        -v /var/run/docker.sock:/var/run/docker.sock \
        -p 8080:8080 \
        --name='strain-processing-notebooks' \
 	      -v ${PWD}/notebooks:/home/jovyan/notebooks \
        ghcr.io/earthscope/strain-processing-notebooks

echo *--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*

