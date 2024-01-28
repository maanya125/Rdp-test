FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# Install GUI and RDP protocol
RUN apt-get update && \
    apt-get install -y xfce4 xrdp && \
    apt-get clean

# Create a new user with password 'hero' and add it to the sudo group
RUN useradd -m -s /bin/bash newuser && \
    echo 'newuser:hero' | chpasswd && \
    adduser newuser sudo

# Expose RDP port
EXPOSE 3389

# Start xrdp
CMD ["xrdp", "-n"]
