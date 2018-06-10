# Originally forked from: git@github.com:gasi/docker-node-hello.git

FROM arm64v8/ubuntu:16.04

LABEL "maintainer"="spino327@gmail.com"
LABEL "description"="Build of tensorflow 1.7.1 for arm64v8."
LABEL "version"="1.7.1"

USER root

####################
# Installing dependencies
####################
RUN apt-get -y update

RUN apt-get -y install python3-pip python3-numpy swig python3-dev
RUN pip3 install wheel

####################
# Installing build of tensorflow
####################
ENV AP /tmp/tensorflow_files
RUN mkdir -p $AP

# copying files
ADD ./files/tensorflow-1.7.1-cp35-cp35m-linux_aarch64.whl $AP/
WORKDIR $AP

RUN pip3 install tensorflow-1.7.1-cp35-cp35m-linux_aarch64.whl

####################
# Entry point
####################
CMD [ "/bin/bash" ]

