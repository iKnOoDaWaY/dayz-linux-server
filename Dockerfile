FROM debian:bullseye

RUN sed -i -e "s/ main[[:space:]]*\$/ main contrib non-free/" /etc/apt/sources.list
RUN dpkg --add-architecture i386
RUN apt update
RUN sudo apt install tmux nano htop curl lib32gcc1 lib32stdc++6 psmisc wget rename -y
RUN udo useradd -m -s /bin/bash '10ftdeep'
RUN sudo su - '10ftdeep'
RUN echo steam steam/question select "I AGREE" | debconf-set-selections
RUN apt install -y curl libcap2 steamcmd

COPY ./run_server.sh /run_server.sh
WORKDIR /server

# Stable:
# STEAM_APP_ID=223350
#
# Experimental:
# STEAM_APP_ID=1042420
ENV STEAM_APP_ID=1042420

VOLUME ["/server"]
ENTRYPOINT ["/run_server.sh"]
