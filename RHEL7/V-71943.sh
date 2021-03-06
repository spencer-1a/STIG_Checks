#!/bin/bash

# V-71943 Lock account for 15 minutes after 3 unsuccessful attempts. 

result="d"

while read m
do
	if [[ $m =~ deny ]]
	then
		if [[ ! $m =~ deny=3 ]]
		then
			echo $m
			result="a"
		fi		
	else
		echo $m
		result="a"
	fi
done <<< "$(sudo cat /etc/pam.d/password-auth | grep pam_faillock.so | grep ^auth)"
if [ "$result" != "a" ]
then
	result="b"
fi
echo $result
