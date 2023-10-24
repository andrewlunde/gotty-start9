FROM ubuntu:23.04
LABEL maintainer="andrewlunde <andrew.lunde@sap.com>"
#FROM thetalabsorg/edgelauncher_mainnet:latest
#FROM thetalabsorg/edgelauncher_mainnet:v1.1.0
##CMD ["/bin/sh" "-c" "/bin/start.sh"]

#RUN apt-get update && apt-get install -y curl
#WORKDIR /src
#COPY . .

EXPOSE 80

RUN apt-get -y update && \
    apt-get install -y htop lsof && \
    apt-get install -y curl && \
    VERSION=v1.0.1 && \
    curl -sLk https://github.com/yudai/gotty/releases/download/$VERSION/gotty_linux_amd64.tar.gz \
    | tar xzC /usr/local/bin && \
    apt-get purge --auto-remove -y curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists*

#ENTRYPOINT ["/usr/local/bin/gotty"]

#CMD ["--permit-write","--reconnect","/bin/bash"]

ADD ./docker_entrypoint.sh /usr/local/bin/docker_entrypoint.sh
RUN chmod a+x /usr/local/bin/docker_entrypoint.sh
