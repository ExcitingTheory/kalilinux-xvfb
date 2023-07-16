# From the official Kali Linux Docker image rolling release
FROM kalilinux/kali-rolling

# Leaving this here for now, but it's not needed
ARG DISPLAY_NUMBER=1
ENV DISPLAY=:$DISPLAY_NUMBER

# Got lucky with this one, there was a ticket about this:
# https://github.com/dnschneid/crouton/issues/4461 `xfce4 dbus-launch not found` in this version of the image so installing dbus-x11
RUN apt-get update -y -q \
  && apt-get install -y -q xvfb xfce4 xfce4-goodies tightvncserver net-tools curl openssh-server dbus-x11

COPY *.sh /opt/
RUN chmod 755 /opt/*.sh

RUN /opt/startx-once.sh
RUN /opt/ssh-keys.sh

ENTRYPOINT /bin/bash
