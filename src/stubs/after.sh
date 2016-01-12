#!/bin/sh

if java -version > /dev/null; then
    echo Java is already installed. Skipping.
else
	add-apt-repository -y ppa:webupd8team/java
	echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
	echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections
	apt-get -y update
	apt-get -y install oracle-java8-installer
fi
if dpkg -l | grep elastic > /dev/null;  then
    echo Elastic is already installed. Skipping.
else
	wget https://download.elasticsearch.org/elasticsearch/release/org/elasticsearch/distribution/deb/elasticsearch/2.1.1/elasticsearch-2.1.1.deb
	dpkg -i elasticsearch-2.1.1.deb
	rm elasticsearch-2.1.1.deb
	service elasticsearch restart
fi
