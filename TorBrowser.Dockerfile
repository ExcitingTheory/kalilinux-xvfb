# From our Dockerfile:
FROM excitingtheory/kalilinux-xvfb

ARG DISPLAY_NUMBER=1
ENV DISPLAY=:$DISPLAY_NUMBER

# More info about torbrowser-launcher:
# https://github.com/micahflee/torbrowser-launcher
RUN apt-get update -y -q \
  && apt-get install -y -q torbrowser-launcher python3 python3-pip

# sudo still TBD but leaving for now, will not be able to switch users in this container.
RUN useradd -s /bin/bash -m username \
  && usermod -aG sudo username

RUN pip3 install selenium pytest
COPY torrc /etc/tor/torrc

USER username
ENV USER=username
ENV HOME=/home/username

RUN /opt/startx-once.sh
RUN /opt/ssh-keys.sh

ENTRYPOINT /bin/bash
