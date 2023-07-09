FROM kalilinux/kali-rolling

ARG DISPLAY_NUMBER=1

ENV DISPLAY=:$DISPLAY_NUMBER

RUN apt-get update -y -q \
  && apt-get install -y -q xvfb xfce4 xfce4-goodies tightvncserver net-tools curl openssh-server

COPY *.sh /opt/
RUN chmod 755 /opt/*.sh

RUN /opt/startx.sh
RUN /opt/ssh-keys.sh

ENTRYPOINT /bin/bash
