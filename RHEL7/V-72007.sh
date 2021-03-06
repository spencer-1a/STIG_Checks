#!/bin/bash

# V-72007 All files and directories must have an owner

result='d'

no_user=`sudo find / -fstype xfs -nouser`
if [ -n "$no_user" ]; then
	echo "NO OWNER: $no_user"
	result='a'
fi

if [ "$result" != "a" ] && [ "$result" != "c" ]
then
	result="b"
fi

echo $result
