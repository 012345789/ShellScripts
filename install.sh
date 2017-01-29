#!/bin/bash

if [ ! -d "PlayGifService" ]; then
	echo "Cloning from Git repository"
	git clone https://github.com/012345789/PlayGifService.git
fi

# If SBT is not installed
if ! hash sbt 2>/dev/null; then
	echo "Downloading SBT"
	echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
	sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
	sudo apt-get update
	wget https://dl.bintray.com/sbt/debian/sbt-0.13.13.deb

	echo "Installing SBT"
	sudo dpkg -i sbt-0.13.13.deb
	sudo apt-get install -f
fi
echo "SBT installation complete."

JAVA_VER=$(java -version 2>&1 | sed 's/.*version "\(.*\)\.\(.*\)\..*"/\1\2/; 1q')

# Java 1.8 is required for SBT to run, but the SBT package installs Java 1.9 by default, which doesn't run too well on Linux VMs
echo "Downloading and installing Java 8"
sudo add-apt-repository ppa:webupd8team/java
sudo apt update; sudo apt install oracle-java8-installer

echo "Setting Java 8 as default"
sudo apt install oracle-java8-set-default

# This part is required for older versions of SBT
# touch repositories
# echo "[repositories]" > repositories
# echo "  local" >> repositories
# echo "  my-ivy-proxy-releases: http://repo.company.com/ivy-releases/, [organization]/[module]/(scala_[scalaVersion]/)(sbt_[sbtVersion]/)[revision]/[type]s/[artifact](-[classifier]).[ext]" >> repositories
# echo "  my-maven-proxy-releases: http://repo.company.com/maven-releases/" >> repositories

echo "Install script complete."

return