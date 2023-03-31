FROM ghcr.io/earthscope/strain-scipy-notebook

WORKDIR /home/jovyan/
MAINTAINER = Mike Gottlieb, Earthscope Inc. mike.gottlieb@earthscope.org

RUN pip install 'earthscopestraintools[mseed,tiledb]'==0.1.4

RUN mkdir examples/
COPY notebooks/level2.ipynb examples/level2.ipynb
COPY notebooks/plot_event.ipynb examples/plot_event.ipynb

EXPOSE 8888
CMD ["jupyter", "lab","--port=8888", "--allow-root"]

