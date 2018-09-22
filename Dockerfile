# base image
FROM python:2

# update & install
RUN apt-get update && apt-get install -y \
  nano \
  tree

# copy source
WORKDIR /usr/src
COPY README.md .
ADD python/ python/

# install python requirements
RUN pip install -r python/GHRePTBot/requirements.txt

# link scripts
RUN ln /usr/src/python/GHRePTBot/ghrept.py /usr/bin/ghreptbot

# make working dir
RUN mkdir -p /home/grptbt
WORKDIR /home/grptbt
