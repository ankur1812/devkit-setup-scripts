#!/bin/bash

echo "\n|========= Java Installation =========|\n"
sudo apt update && sudo apt install openjdk-17-jdk -y
echo "\n-------------\nJava installed!\n"
java -version

echo "\n|========= Maven Installation =========|\n"
sudo apt install maven -y
echo "\n-------------\nMaven installed!\n"
mvn --version

