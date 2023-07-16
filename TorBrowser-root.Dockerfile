FROM excitingtheory/kalilinux-xvfb

ARG DISPLAY_NUMBER=1
ENV DISPLAY=:$DISPLAY_NUMBER

# More info about torbrowser-launcher:
# https://github.com/micahflee/torbrowser-launcher
RUN apt-get update -y -q \
  && apt-get install -y -q torbrowser-launcher python3 python3-pip

RUN pip3 install selenium pytest

COPY torrc /etc/tor/torrc

RUN /opt/startx-once.sh
RUN /opt/ssh-keys.sh

ENTRYPOINT /bin/bash
