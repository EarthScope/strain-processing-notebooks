# Strain Procesing Notebooks
This repo runs a containerized environment for strain processing notebooks.  It is built on Ubuntu 20.04, 
with SPOTL, BAYTAP-08, Jupyter Scipy Notebooks.

This directory will be mounted to the container, so any figures, data, or local changes will be saved after the container shuts down.

Usage:
> git clone git@github.com:EarthScope/strain-processing-notebooks.git
> ./run_docker.sh

Once the kernel has started, click the last link in the terminal to load Jupyer Lab in a browser
>  http://127.0.0.1:8888/lab?token=...

Some example notebooks are stored in the container image under examples

imageNotebooks are located in the notebooks folder.

To pull any updates and rebuild.
> git pull origin main

> ./build_docker.sh