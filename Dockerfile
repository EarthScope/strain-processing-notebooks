FROM scipy-notebook

WORKDIR /home/jovyan/
MAINTAINER = Mike Gottlieb, Earthscope Inc. mike.gottlieb@earthscope.org

RUN pip install 'earthscopestraintools[mseed,tiledb]'==0.1.3

EXPOSE 8888
CMD ["jupyter", "lab","--port=8888", "--allow-root"]

