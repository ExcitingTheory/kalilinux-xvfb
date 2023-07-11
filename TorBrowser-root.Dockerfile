FROM excitingtheory/kalilinux-xvfb
ARG DISPLAY_NUMBER=1

ENV DISPLAY=:$DISPLAY_NUMBER

# https://github.com/micahflee/torbrowser-launcher
# https://github.com/dnschneid/crouton/issues/4461 lmao that was lucky: `xfce4 dbus-launch not found`
RUN apt-get update -y -q \
  && apt-get install -y -q torbrowser-launcher python3 python3-pip dbus-x11

RUN pip3 install selenium torrequest pytest
COPY torrc /etc/tor/torrc

RUN /opt/startx.sh
RUN /opt/ssh-keys.sh

ENTRYPOINT /bin/bash
