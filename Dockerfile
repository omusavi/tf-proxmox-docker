FROM ubuntu:jammy

# Minimum reqs
RUN apt-get update && apt-get install -y \
    gpg \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Hashicorp apt repo
RUN wget -O- https://apt.releases.hashicorp.com/gpg | \
    gpg --dearmor | \
    tee /usr/share/keyrings/hashicorp-archive-keyring.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com jammy main" | \
    tee /etc/apt/sources.list.d/hashicorp.list

RUN apt-get update && apt-get install -y \
    terraform \
    && rm -rf /var/lib/apt/lists/*

ENV TF_LOG=DEBUG
COPY . /opt/tf-proxmox-docker

WORKDIR /opt/tf-proxmox-docker

RUN wget https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img
RUN terraform init
ENTRYPOINT ["terraform", "apply"]