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

WORKDIR /

RUN mkdir -p /usr/local/SU2

ADD ./SU2 /usr/local/SU2

WORKDIR /data/SU2_HOME

ADD ./init /data/SU2_HOME

WORKDIR /

RUN export SU2_HOME=/data/SU2_HOME && \
	export SU2_RUN=/usr/local/SU2/bin && \
	export PATH=$SU2_RUN:$PATH && \
	export PYTHONPATH=$SU2_RUN:$PYTHONPATH

# Copied from nimbix/image-common
RUN apt-get -y update && \
    DEBIAN_FRONTEND=noninteractive apt-get -y install curl && \
    curl -H 'Cache-Control: no-cache' \
        https://raw.githubusercontent.com/nimbix/image-common/master/install-nimbix.sh \
        | bash

# Expose port 22 for local JARVICE emulation in docker
EXPOSE 22

COPY ./NAE/AppDef.json /etc/NAE/AppDef.json

CMD sudo /data/SU2_HOME/init.sh
