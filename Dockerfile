FROM ubuntu:20.04
RUN apt-get update -y
RUN apt-get install wget build-essential -y
WORKDIR /opt/
RUN wget https://github.com/BTGSCOINDEV/BTGS/releases/download/v30.2.3/btgs-x86_64-linux-gnu.tar.gz
RUN tar zxvf btgs-x86_64-linux-gnu.tar.gz
RUN mv btgs/bin/* /usr/bin/
CMD /usr/bin/bitcoind -printtoconsole
