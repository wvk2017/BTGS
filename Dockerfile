FROM ubuntu:22.04

# Voorkom dat installaties vastlopen op interactieve vragen
ENV DEBIAN_FRONTEND=noninteractive

# Installeer de benodigde pakketten en ruim direct de apt-cache op
RUN apt-get update -y && \
    apt-get install -y wget && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /opt/

# Download de specifieke Bitcoin Gold release
RUN wget https://github.com

# Pak het archief uit, verplaats de inhoud veilig via een shell-evaluatie en ruim op
RUN tar zxvf btgs-x86_64-linux-gnu.tar.gz && \
    sh -c 'cp -r btgs-x86_64-linux-gnu/bin/* /usr/bin/' && \
    rm -rf btgs-x86_64-linux-gnu btgs-x86_64-linux-gnu.tar.gz

# Start het bitcoingoldd-proces als hoofdproces (Exec-form)
CMD ["/usr/bin/bitcoingoldd", "-printtoconsole"]

