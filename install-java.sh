#!/bin/bash

echo "installing JAVA"

sudo apt install openjdk-17-jre-headless

java_status="java --version"

if $java_status 
then 
	echo "version of JAVA:"
	$java_status
else
	echo "Java not installed yet"
fi
