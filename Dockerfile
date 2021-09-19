FROM ubuntu:18.04
LABEL org.opencontainers.image.source https://github.com/rez0n/ant-media-server
ARG RELEASE_URL

RUN apt-get update --fix-missing \
	&& apt-get -y install libx11-dev unzip wget openjdk-11-jdk ca-certificates p11-kit --no-install-recommends \
	&& wget --no-check-certificate ${RELEASE_URL} -O /tmp/ant.zip \
	&& 	unzip /tmp/ant.zip -d /usr/local/ \
	&& 	mv /usr/local/ant-media-server /usr/local/antmedia \
	&& 	rm -rfv /var/lib/apt/lists/* /tmp/*

WORKDIR /usr/local/antmedia
RUN chmod 775 /usr/local/antmedia/start.sh
ENTRYPOINT /bin/bash -c /usr/local/antmedia/start.sh
