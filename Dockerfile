FROM nvidia/cudagl:10.2-base-ubuntu18.04

ENV DEBIAN_FRONTEND=noninteractive

########## Python3 ##########
COPY . /home
WORKDIR /home
RUN apt-get update && \
	apt-get install -y python3-pip

RUN python3.6 -m pip install --no-cache-dir -U pip
RUN python3.6 -m pip install --no-cache-dir -U setuptools
RUN ln -s /usr/bin/python3.6 /usr/bin/python
RUN ln -s /usr/bin/pip3 /usr/bin/pip

RUN	python3 -m pip install --upgrade pip && python3 -m pip install -r requirements.txt