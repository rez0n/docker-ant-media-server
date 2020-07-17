FROM ubuntu:18.04

RUN apt-get update --fix-missing \
	&& apt-get -y install libx11-dev unzip wget openjdk-8-jdk ca-certificates p11-kit --no-install-recommends \
	&& wget --no-check-certificate https://github.com/ant-media/Ant-Media-Server/releases/download/ams-v2.0.0/ant-media-server-2.0.0-community-2.0.0-20200504_1842.zip -O /tmp/ant.zip \
	&& 	unzip /tmp/ant.zip -d /usr/local/ \
	&& 	mv /usr/local/ant-media-server /usr/local/antmedia \
	&& 	rm -rfv /var/lib/apt/lists/* /tmp/*

WORKDIR /usr/local/antmedia
RUN chmod 775 /usr/local/antmedia/start.sh
ENTRYPOINT /bin/bash -c /usr/local/antmedia/start.sh
