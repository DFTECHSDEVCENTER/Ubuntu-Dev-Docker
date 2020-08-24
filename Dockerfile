FROM amd64/ubuntu:18.04
RUN apt-get update && apt-get upgrade -y && apt install tzdata

RUN echo "Asia/Kolkata" | tee /etc/timezone
RUN dpkg-reconfigure --frontend noninteractive tzdata

LABEL maintainer="DFTechs <dftechs@dfcommunity.win>" \
  org.label-schema.name="DFTechs Ubuntu Dev" \
  org.label-schema.vendor="Delta Force Community" \
  org.label-schema.schema-version="1.0"

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm

RUN apt-get update -y && \
  apt-get upgrade -y && \
  apt-get install -y \
    ca-certificates \
    bash \
    curl \
    wget \
    procps \
    apt-utils \
    apt-transport-https \
    iputils-ping \
    bzip2 \
    unzip \
    cron \
    sshpass \
    tree \
    jq \
    git \
    python3 \
    python \
    gcc \
    g++ \
    make \
    php \ 
    gnupg && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN wget https://bootstrap.pypa.io/get-pip.py && python get-pip.py && rm -rf get-pip.py

RUN curl -sL https://deb.nodesource.com/setup_lts.x | bash - && apt-get install -y nodejs
EXPOSE 80
EXPOSE 8080
EXPOSE 5000
EXPOSE 443

CMD ["bash"]