FROM ubuntu:20.04

# LABEL about the custom image
LABEL maintainer="mike.gottlieb@earthscope.org"
LABEL version="0.1"

RUN apt-get update \
    && apt-get -y install build-essential \
    && apt-get -y install gfortran-7 \
    && apt-get -y install wget vim

# Download Baytap08 and modify the makefile to run/compile
RUN cd /opt/ \
    && wget http://igppweb.ucsd.edu/~agnew/Spotl/spotl.tar.gz --no-check-certificate \
    && tar -xzf spotl.tar.gz \
    && rm spotl.tar.gz \
    && cd spotl/src/ \
    && echo "FTN = gfortran-7" >> tempfile \
    && echo "FFLAGS = -O3 -Wuninitialized -fno-f2c -fno-automatic -fno-range-check -fno-backslash" >> tempfile \
    && echo "CC = /usr/bin/gcc" >> tempfile \
    && echo "CFLAGS = -c" >> tempfile \
    && cat Makefile >> tempfile \
    && mv tempfile Makefile \
    && cd ../ \
    && ./install.comp \
    && cd tidmod/ascii \
    && sed -i 's/gzcat/gunzip -c/g' Tobinary \
    && cd ../../ \
    && sed -i 's/Tobinary/.\/Tobinary/g' install.rest \
    && sed -i 's/gzcat/gunzip -c/g' install.rest \
    && sed -i 's/rm /rm -f /g' install.rest \
    && ./install.rest \
    && cd /opt/spotl/working/Exampl/ \
    && sed -i 's/spotl//g' ex1.scr \
    && sed -i 's/spotl//g' ex2.scr \
    && sed -i 's/spotl//g' ex3.scr \
    && sed -i 's/spotl//g' ex4.scr \
    && sed -i 's/spotl//g' ex5.scr \
    && sed -i 's/spotl//g' ex6.scr \
    && sed -i 's/ex5.scr/.\/ex5.scr/g' ex5.scr \
    && mkdir -p /opt/spotl/results

COPY spotl-working /opt/spotl/working/
ENV PATH="/opt/spotl/bin:/opt/spotl/working:${PATH}"

# Download Baytap08 and modify the makefile to run/compile
RUN cd /opt/ \
    && wget https://igppweb.ucsd.edu/~agnew/Baytap/baytap08.tar.gz \
    && tar -xzf baytap08.tar.gz \
    && rm baytap08.tar.gz \
    && cd baytap08/src/ \
    && echo "BIN=../bin/" >> tempfile \
    && echo " " >> tempfile \
    && echo "FTN = gfortran-7" >> tempfile \
    && echo " " >> tempfile \
    && echo "FFLAGS = -O2  -Wunused -Wno-globals -fno-f2c -fno-automatic -fno-backslash" >> tempfile \
    && echo " " >> tempfile \
    && echo "baytap08: baytap08.f" >> tempfile \
    && printf "\t\$(FTN) \$(FFLAGS) baytap08.f -o \$(BIN)baytap08\n" >> tempfile \
    && mv tempfile makefile \
    && cat makefile \
    && make

# Add baytap to path
ENV PATH="/opt/baytap08/bin:${PATH}"

CMD ["echo", "enter 'docker run -it strain-processing-notebooks /bin/bash' to access interactive terminal"]
