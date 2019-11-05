FROM ubuntu:19.04 as python37

RUN echo "===> Adding build-essential"  && \
    apt-get update  -y &&  apt-get install -y build-essential libssl-dev \
    libffi-dev python3.7-dev virtualenv python3-setuptools python3-pip default-jdk \
    ca-certificates curl apt-transport-https lsb-release gnupg --no-install-recommends && \
    apt-get clean

RUN curl -sL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | tee /etc/apt/trusted.gpg.d/microsoft.asc.gpg > /dev/null && \
    AZ_REPO=$(lsb_release -cs) && \
    echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | \
    tee /etc/apt/sources.list.d/azure-cli.list && \
     apt-get update && \
    apt-get install azure-cli

# RUN JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64/bin/" >> /etc/environment && \
#    source /etc/environment
# apt-get install ca-certificates curl apt-transport-https lsb-release gnupg

COPY ./cp1.c /.
