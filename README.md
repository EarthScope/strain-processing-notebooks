# Rome Strainmeter Shortcourse Notebook Environment Install Instructions
This repo runs a containerized environment for strain processing notebooks.  It is built on Ubuntu 20.04, with SPOTL, BAYTAP-08, Jupyter Scipy Notebooks.  

The branch italy-2024 is built for use during the June 2024 Rome Strainmeter Short Course .

The local notebooks directory will be mounted to the container, so any figures, data, or local changes made in that directory will be saved after the container shuts down.

## Quick-start (if Docker is already installed):

If you have git installed, you can clone the repository with the following:
> git clone -b italy-2024 https://github.com/EarthScope/strain-processing-notebooks.git

Alternatively, you can download the repository with this link: 
> https://github.com/EarthScope/strain-processing-notebooks/archive/refs/heads/italy-2024.zip


Cd into the repo and run the ```run_docker.sh``` script from the downloaded (and unzipped) folder with the following command: 

For Mac/Linux Terminal:
> ./run_docker.sh

FOr Windows PowerShell:
> sh .\run_docker.sh

This will get the docker image from the github container registry, mount the notebooks directory to your local directory, and start a Juptyer lab server. 

Once the kernel has started, click the last link in the terminal to load Jupyer Lab in a browser
>  http://127.0.0.1:8888/lab?token=...

**To test things are working, navigate to notebooks directory and run the environment-test.ipynb notebook.  Please reach out to mike.gottlieb@earthscope.org if you run into problems.**


If you are unfamiliar with Jupyter, we suggest taking a look through the Jupyter tutorials linked under the ```help > Jupyter Reference``` menu in Jupyter Lab. 

Finally, test that the environment is working properly by running through the ```environment-test.ipynb``` notebook in the ```notebooks``` directory. 

If you want to modify notebooks and build your own, work in the notebooks directory so that 
your changes will be saved after the container stops.

## Mac pre-installation

Follow the instructions to install Docker Desktop (https://docs.docker.com/desktop/install/mac-install/).

Now you should be able to follow the quick-start instructions.

## Linux pre-installation

Follow the instructions to install Docker Desktop  (https://docs.docker.com/desktop/install/linux-install/).

Now you should be able to follow the quick-start instructions.

## Windows pre-installation (if Docker is not already installed)

Follow the instructions to install Windows Subsystem for Linux (WSL) from the Windows PowerShell window (https://learn.microsoft.com/en-us/windows/wsl/install)
- We tested and suggest installing setting the Ubuntu distribution as the default 
- Make sure that the WSL and Virtual Machine Platform features are enabled, and if things still aren't running, make sure Virtualization is enabled in the BIOS settings on startup
- If your system does not work with wsl, you may need to follow the Hyper-V instructions instead

Follow the instructions to install Docker with wsl backend (https://docs.docker.com/desktop/install/windows-install/).

Now you should be able to follow the quick-start instructions.

## Linked images:
- ghcr.io/earthscope/fortran-base-image 
  - Ubuntu 20.04 with baytap08 and spotl installed
- ghcr.io/earthscope/strain-scipy-notebook
  - jupyter scipy-notebook built off fortran-base-image
- ghcr.io/earthscope/strain-processing-notebooks
  - strain-scipy-notebook with earthscopestraintools installed