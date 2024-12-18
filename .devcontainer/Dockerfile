#FROM mcr.microsoft.com/devcontainers/base:debian
FROM mcr.microsoft.com/devcontainers/universal:2-linux

ENV DEBIAN_FRONTEND=noninteractive

# Username and password for the non-root user in the container.
ENV USERNAME=student
ENV PASSWD=student

# Install some base applications.
#RUN apt-get install --no-install-recommends -y \
#        whatever-goes-here

    
# Create the non-root user inside the container and give them sudo privlidges.
RUN useradd \
    -m $USERNAME -p "$(openssl passwd -1 $PASSWD)" \
    -s /bin/bash \
    -G sudo,docker

# Stuff to reduce image size.
USER root
RUN apt-get clean -y \
 && apt-get autoclean -y \
 && apt-get autoremove -y \
 && rm -rf /var/lib/apt/lists/*

USER $USERNAME
WORKDIR /home/$USERNAME