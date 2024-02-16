# Base image
FROM --platform=linux/amd64 ubuntu:20.04

# Install Docker CE CLI
RUN apt-get update && apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common 
    
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
RUN apt-cache policy docker-ce
RUN apt-get update
RUN apt-get install -y docker-ce-cli

# Install Docker compose
RUN apt-get install -y docker-compose

# Install Git and some tools
RUN apt-get install -y git mc vim nano
RUN apt-get install -y iputils-ping

# Install Node.js
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs

# Gruppe users anlegen
RUN groupadd docker

# Nutzer jenai:users anlegen und standard shell auf bash setzen
RUN useradd -m -s /bin/bash jenai


# jenai in die Gruppe docker aufnehmen
RUN usermod -aG docker jenai
# Create a password for the user jenai
RUN echo "jenai:jenai" | chpasswd

# Set the working directory
WORKDIR /home/jenai

