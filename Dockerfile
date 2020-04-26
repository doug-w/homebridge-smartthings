FROM node:10-jessie
#FROM nodesource/jessie
#FROM nodesource/jessie:5.8.0
MAINTAINER Doug Warren <doug.warren@gmail.com>

##################################################
# Set environment variables                      #
##################################################

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm

##################################################
# Install tools                                  #
##################################################

RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install -y apt-transport-https
RUN apt-get install -y locales
RUN apt-get install -y curl wget git python build-essential make g++ libavahi-compat-libdnssd-dev libkrb5-dev vim net-tools nano libstdc++6
RUN alias ll='ls -alG'

##################################################
# Install homebridge                             #
##################################################

RUN npm install -g https://github.com/doug-w/homebridge --unsafe-perm

# depending on your config.json you have to add your modules here!
# RUN npm install -g homebridge-philipshue --unsafe-perm
RUN npm install -g homebridge-smartthings --unsafe-perm
# RUN npm install -g homebridge-ninjablock-temperature --unsafe-perm
# RUN npm install -g homebridge-ninjablock-humidity --unsafe-perm
# RUN npm install -g homebridge-ninjablock-alarmstatedevice --unsafe-perm
# RUN npm install -g homebridge-luxtronik2 --unsafe-perm
RUN npm install -g homebridge-people --unsafe-perm
RUN npm install -g homebridge-tesla --unsafe-perm
#RUN npm install -g homebridge-mqttswitch --unsafe-perm
#RUN npm install -g homebridge-edomoticz --unsafe-perm
RUN npm install -g homebridge-config-ui-x --unsafe-perm
RUN npm install -g homebridge-alexa
RUN npm install -g homebridge-server@latest
RUN npm install -g ring-client-api
RUN npm install -g homebridge-harmony
RUN npm install -g homebridge-plex-sensors
RUN npm install -g homebridge-nest

##################################################
# Start                                          #
##################################################

USER root
RUN mkdir -p /var/run/dbus

ADD image/run.sh /root/run.sh

EXPOSE 5353 51826
CMD ["/root/run.sh"]
