FROM excitingtheory/kalilinux-xvfb
ARG DISPLAY_NUMBER=1

ENV DISPLAY=:$DISPLAY_NUMBER

RUN apt-get update -y -q \
  && apt-get install -y -q torbrowser-launcher python3 python3-pip dbus-x11

RUN useradd -s /bin/bash -m username \
  && usermod -aG sudo username

RUN pip3 install selenium torrequest pytest
COPY torrc /etc/tor/torrc

USER username
ENV USER=username
ENV HOME=/home/username

RUN /opt/startx.sh
RUN /opt/ssh-keys.sh

ENTRYPOINT /bin/bash
