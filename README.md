# Strain Procesing Notebooks
This repo sets up a containerized environment to run strain processing notebooks.  
This directory will be mounted to the container, so any figures, data, or local changes will be saved after the container shuts down.

Usage:
1. The first time run the build_docker.sh script. This also runs the docker
> ./build_docker.sh
2. Once the image exists locally, it will be faster to just run run_docker.sh to open the jupyter lab server
> ./run_docker.sh

Once the kernel has started, click the last link in the terminal to load Jupyer Lab in a browser
>  http://127.0.0.1:8888/lab?token=...

Notebooks are located in the notebooks folder.

To pull any updates and rebuild.
> git pull origin main

> ./build_docker.sh