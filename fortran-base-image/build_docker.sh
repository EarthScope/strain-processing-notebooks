#! /bin/bash

echo "Resetting docker"
echo *--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*
echo "Stop / Remove fortran-base-container - command"
echo *--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*
docker stop fortran-base-container
docker rm fortran-base-container

echo *--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*
echo "Remove fortran-base-image, image that made fortran-base-container"
echo *--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*
docker image rm fortran-base-image

echo *--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*
echo "ReBuild fortran-base-image in current directory"
echo *--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*
#docker build --rm --no-cache -t strain-processing-notebooks .
docker build --rm -f Dockerfile -t fortran-base-image .
#--no-cache
echo *--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*
echo "docker run -it --name fortran-base-container fortran-base-image  /bin/bash"
echo "Interactive, on port 8888, name = fortran-base-container "
echo *--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*



## Open jupyter notebook directly
#docker run \
#        -it \
#        -p 8888:8888 \
#        --name='strain-processing-notebooks-container' \
# 	      -v ${PWD}/notebooks:/home/jovyan/notebooks \
#        strain-processing-notebooks
#
## -e JUPYTER_ENABLE_LAB=yes
##        -v ~/repos/base_docker_stack/notebooks:/home/jovyan/event_response/notebooks \
##        -v ~/repos/base_docker_stack/events:/home/jovyan/event_response/events \
## 	      -v ~/repos/base_docker_stack/bin:/home/jovyan/event_response/bin \
#
## If you want to add your own external volume add another -v command to the docker run command
##-v ~/[path_to_local_directory]:/home/jovyan/event_response/[personal_directory]
#
#echo *--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*

