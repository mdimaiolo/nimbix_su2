FROM ubuntu:18.04
ENV LANG C.UTF-8

RUN apt-get update && apt-get install -y \
    python3 \
    pkg-config \
    python3-pip \
    git \
    build-essential \
    python3-numpy \
    python3-scipy \
    python3-mpi4py \
    swig \
    libopenmpi-dev \
    openmpi-bin \
    ccache
# && rm -rf /var/lib/apt/lists/* \
# && update-alternatives --install /usr/bin/python python /usr/bin/python3 10 \
# && /usr/sbin/update-ccache-symlinks \
# && echo 'export PATH="/usr/lib/ccache:$PATH"' | tee -a ~/.bashrc 

#RUN mkdir -p /usr/local

WORKDIR /usr/local

#RUN curl -O "https://github.com/su2code/SU2/releases/download/v7.1.1/SU2-v7.1.1-linux64-mpi.zip"
#RUN tar xvf "SU2-v7.1.1-linux64-mpi.zip"

#RUN mv /usr/local/src/SU2-v7.1.1-linux64-mpi /usr/local/SU2
#RUN rm "/usr/local/src/SU2-v7.1.1-linux64-mpi.zip"

ADD ./SU2 /usr/local/SU2

RUN export SU2_HOME=/data/SU2_HOME
RUN export SU2_RUN=/usr/local/SU2/bin
RUN export PATH=$SU2_RUN:$PATH
RUN export PYTHONPATH=$SU2_RUN:$PYTHONPATH

# Ensure execute permissions are set on compileSU2.sh
USER root
RUN chmod -R 777 /data/SU2_HOME
USER nimbix

COPY ./NAE/AppDef.json /etc/NAE/AppDef.json