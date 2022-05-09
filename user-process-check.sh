#!/bin/bash

read -p "enter user name: " user_name

if [ $user_name == "root" ]
then
	read -p "sort output by CPU or memory (c/m)?: " sort_type
	read -p "how many string you want to see?: " lines_quantity

	if [ "$sort_type" == "c" ]
	then
		ps -U $user_name u --sort=%cpu | head -$lines_quantity
	elif [ "$sort_type" == "m" ]
	then
		ps -U $user_name u --sort=vsz | head -$lines_quantity
	else
		echo "sort type unrecognized. no sorting applied"
		ps -U $user_name u | head -$lines_quantity
	fi
elif [ -d "/home/$user_name" ]
then 
	read -p "sort output by CPU or memory (c/m): " sort_type
	read -p "how many string you want to see?: " lines_quantity

	if [ "$sort_type" == "c" ]
        then
                ps -U $user_name u --sort=%cpu | head -$lines_quantity
        elif [ "$sort_type" == "m" ]
        then
                ps -U $user_name u --sort=vsz | head -$lines_quantity
        else
                echo "sort type unrecognized. no sorting applied"
                ps -U $user_name u | head -$lines_quantity
        fi
else
	echo "user does not exists. try again"
fi
