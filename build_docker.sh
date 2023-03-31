#! /bin/bash

echo "Resetting docker"
echo *--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*
echo "Stop / Remove strain-processing-notebooks container - command"
echo *--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*
docker stop strain-processing-notebooks-container
docker rm strain-processing-notebooks-container

echo *--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*
echo "Remove strain-processing-notebooks image, image that made strain-processing-notebooks-container"
echo *--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*
docker image rm ghcr.io/earthscope/strain-processing-notebooks

echo *--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*
echo "ReBuild strain-processing-notebooks image in current directory"
echo *--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*
#docker build --rm --no-cache -t strain-processing-notebooks .
docker build --rm -f Dockerfile -t ghcr.io/earthscope/strain-processing-notebooks .
#--no-cache
echo *--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*
echo "docker run strain-processing-notebooks_docker container"
echo "Interactive, on port 8888, name = strain-processing-notebooks "
echo *--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*

# Open jupyter notebook directly
docker run \
        -it \
        -p 8888:8888 \
        --name='strain-processing-notebooks-container' \
        ghcr.io/earthscope/strain-processing-notebooks
        #-v ${PWD}/notebooks:/home/jovyan/notebooks \

#docker push ghcr.io/earthscope/strain-processing-notebooks

# -e JUPYTER_ENABLE_LAB=yes
#        -v ~/repos/base_docker_stack/notebooks:/home/jovyan/event_response/notebooks \
#        -v ~/repos/base_docker_stack/events:/home/jovyan/event_response/events \
# 	      -v ~/repos/base_docker_stack/bin:/home/jovyan/event_response/bin \

# If you want to add your own external volume add another -v command to the docker run command
#-v ~/[path_to_local_directory]:/home/jovyan/event_response/[personal_directory]

echo *--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*

