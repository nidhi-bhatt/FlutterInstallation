#!/bin/bash

## File: install-jdk.sh
## Copyright © 2022 Muzaffar Rayyan Auhammud
## License: MIT License (https://mit-license.org/)

JDK_VERSION=18.0.1.1
JDK_ROOT=/opt/openjdk
JAVA_HOME=$JDK_ROOT/jdk-$JDK_VERSION

ENV_FILE="~/.profile"
DISTRO=$(uname -r)
if [[ $DISTRO == *"MANJARO"* || $DISTRO == *"ARCH"* ]]
then
  ENV_FILE="/etc/profile"
fi
echo "" | sudo tee -a $ENV_FILE

cd ~/Downloads
wget -c https://download.java.net/java/GA/jdk${JDK_VERSION}/65ae32619e2f40f3a9af3af1851d6e19/2/GPL/openjdk-${JDK_VERSION}_linux-x64_bin.tar.gz
sudo mkdir -p $JDK_ROOT && sudo tar xzf openjdk-${JDK_VERSION}_linux-x64_bin.tar.gz -C $JDK_ROOT
echo "export JAVA_HOME=$JAVA_HOME" | sudo tee -a $ENV_FILE

echo "export PATH=\$PATH:\$JAVA_HOME/bin" | sudo tee -a $ENV_FILE
source $ENV_FILE
