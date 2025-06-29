FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

# Install compilers, vim, and sudo
RUN apt-get update && \
    apt-get install -y build-essential vim sudo && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY server.c /tmp/

# Create user 'ashbyp' and change ownership of home directory
RUN useradd -m -s /bin/bash ashbyp && \
    echo 'ashbyp ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \
    chown -R ashbyp:ashbyp /home/ashbyp

# Declare a volume
VOLUME ["/home/ashbyp"]

# Switch to the new user
USER ashbyp
WORKDIR /home/ashbyp

CMD ["/bin/bash"]

