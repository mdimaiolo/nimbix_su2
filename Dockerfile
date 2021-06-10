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

RUN export SU2_HOME=/home/nimbix/SU2_HOME
RUN export SU2_RUN=/home/nimbix/SU2/bin
RUN export PATH=$SU2_RUN:$PATH
RUN export PYTHONPATH=$SU2_RUN:$PYTHONPATH