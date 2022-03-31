#!/bin/bash

help () {
	echo "sh make.sh module_name"
	echo "xy-transformer xy-customer xy-billing"
	echo "xy-cms xy-link xy-openapi xy-operator xy-sms-api"
	echo "xy-robot xy-sms-media-msg xy-sms-rcs-msg xy-sms-rcs-business xy-sms-text-msg-cmpp"
}

case $1 in
	all)
		echo "abc"
	;;
	 help|h|-h|--help)
		help
	;;
	so)
		echo "soso"
	;;
	*)
		if [ $# == 0 ] ;then
			help
			exit 1
		fi

		echo "start compile"
		mod=$1
		mod_srv=$mod-service
		echo "source file" + $mod
		echo $mod_srv
		echo "start build and docker build."
		if [ ! -d $mod ] ;then
			echo "project not exist clone"
			git clone http://scm.mfexcel.com/imos/${mod}.git
		fi 
		if [ ! -d "$mod_srv" ] ;then
			cd $mod
			sed -i "s/10.0.80.106/10.0.80.106/g" `grep -rl "10.0.80.106" --include="*.*" ./`
			sed -i "1c FROM openjdk:8-jre-alpine" `grep -rl  --include="Dockerfile" ./`
			#sed -i "s/registry.bizport.cn\/base\/openjdk:8-jre-alpine/openjdk:8-jre-alpine/g"  `grep -rl  --include="Dockerfile" ./`
			#sed -i "s/registry.bizport.cn\/base\/openjdk:8-jre-buster/g"  `grep -rl  --include="Dockerfile" ./`
			cd $mod_srv && mvn clean compile package -DskipTests && docker build --build-arg MOD_NAME=$mod_srv -t $mod_srv:v1 .
		else
			cd $mod && mvn clean compile package -DskipTests && docker build --build-arg MOD_NAME=$mod -t $mod_srv:v1 .
		fi
esac
