FROM jupyter/scipy-notebook

WORKDIR /home/jovyan/
MAINTAINER = Mike Gottlieb, Earthscope Inc. mike.gottlieb@earthscope.org

RUN mamba install geopy
RUN pip install 'earthscopestraintools[mseed,tiledb]'==0.0.9

EXPOSE 8888
CMD ["jupyter", "lab","--port=8888"]

