FROM excitingtheory/kalilinux-xvfb
ARG DISPLAY_NUMBER=1

ENV DISPLAY=:$DISPLAY_NUMBER

RUN apt-get update -y -q \
  && apt-get install -y -q torbrowser-launcher python3 python3-pip dbus-x11

RUN pip3 install selenium torrequest pytest
COPY torrc /etc/tor/torrc

RUN /opt/startx.sh
RUN /opt/ssh-keys.sh

ENTRYPOINT /bin/bash
