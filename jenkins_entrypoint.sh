#!/bin/bash
set -e
chown -R jenkins:jenkins $JENKINS_HOME

if [ -n $PORT0 ]
then
	echo "PORT0 is set to $PORT0"
	JENKINS_OPTS="--httpPort=$PORT0"
else
	JENKINS_OPTS=""
fi

/usr/local/bin/jenkins.sh $JENKINS_OPTS
