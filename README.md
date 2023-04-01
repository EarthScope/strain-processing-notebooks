# Strain Procesing Notebooks
This repo runs a containerized environment for strain processing notebooks.  It is built on Ubuntu 20.04, 
with SPOTL, BAYTAP-08, Jupyter Scipy Notebooks.

This directory will be mounted to the container, so any figures, data, or local changes will be saved after the container shuts down.

## Usage:
Clone the repo:
> git clone git@github.com:EarthScope/strain-processing-notebooks.git

Run the following script, which will get the docker image from the github container 
registry, mount the notebooks directory to your local directory, and start a Juptyer lab
server. 
> ./run_docker.sh

Once the kernel has started, click the last link in the terminal to load Jupyer Lab in a browser
>  http://127.0.0.1:8888/lab?token=...

Some example notebooks are stored for reference in the container image under examples

If you want to modify notebooks and build your own, work in the notebooks directory so that 
your changes will be saved after the container stops.


## Linked images:
- ghcr.io/earthscope/fortran-base-image 
  - Ubuntu 20.04 with baytap08 and spotl installed
- ghcr.io/earthscope/strain-scipy-notebook
  - jupyter scipy-notebook built off fortran-base-image
- ghcr.io/earthscope/strain-processing-notebooks
  - strain-scipy-notebook with earthscopestraintools installed