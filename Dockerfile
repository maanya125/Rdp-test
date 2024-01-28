FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# Create a new user with root permissions
RUN useradd -m -s /bin/bash -G sudo newuser && echo 'hero:hero' | chpasswd

# Install GUI
RUN apt-get update && apt-get install -y xfce4 xrdp

# Install RDP protocol
RUN apt-get install -y xrdp

EXPOSE 3389

CMD ["xrdp", "-n"]
