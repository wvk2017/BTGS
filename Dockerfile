FROM ubuntu:22.04
RUN apt-get update -y
RUN apt-get install wget -y
WORKDIR /opt/
RUN wget https://github.com/BTGSCOINDEV/BTGS/releases/download/v30.2.3/btgs-x86_64-linux-gnu.tar.gz
RUN tar btgs-x86_64-linux-gnu.tar.gz
RUN mv bin/btgs/* /usr/bin/
CMD /usr/bin/bitcoingold -printtoconsole
