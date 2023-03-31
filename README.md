# Strain Procesing Notebooks
This repo sets up a containerized environment to run strain processing notebooks.  
This directory will be mounted to the container, so any figures, data, or local changes will be saved after the container shuts down.

Usage:
> ./run_docker.sh

Once the kernel has started, click the last link in the terminal to load Jupyer Lab in a browser
>  http://127.0.0.1:8888/lab?token=...

Some example notebooks are stored in the container image under examples

imageNotebooks are located in the notebooks folder.

To pull any updates and rebuild.
> git pull origin main

> ./build_docker.sh