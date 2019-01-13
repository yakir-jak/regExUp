#!/bin/bash

###########################################################################################
#
# Created By : Yakir BST
# Purpose : Add Users From List
# Date : Sat Jan  5 21:38:05 IST 2019
# Version : 0.0.1
#
###########################################################################################



###In the Script the user have 2 options to creat users. it can be a dingle user or a prepered list. (text file with names)

### VARIABLES ###

Choose_From_Links=cfl
User_List=ul
S_User=su

echo "Select how you want to Add User : "
###Start in a simle Select menu 
select OP in "Single_User" "Choose_From_List" ; 
do
###Print the picked option
echo " you chose $OP " 
sleep 1 
###Statement in case for list
	if [ $OP == "$cfl" ];then
	echo "choose your List"
###Asking the user for a name of a file
	read -r ul
###Open a for loop for the chosen list
	
		for u in $( cat $ul );
		do
			sudo useradd $u;
				if [ $? == 9 ];then
###Exit status 9 means the user existing
###Print if the NEW user already exist or successfully created
				echo "###User $u Already Exist###"
		#	continue
				elif [ $? == 0 ];then
				echo "###The User $u  Added Successfully###"
#		else
#		echo "thers a problem"
###Ending Statement	
				fi			
		sleep 1
		done
				
	fi
###Open A New Statemant fot "Single_User" option

	if [ $OP == "$Single_User" ];then
	
###Asking from the user to type the name of the NEW user
	echo "Type the name of the new user :"
	read -r SU

	sudo useradd $su
	fi
		if [ $? == 9 ];then
		echo "###The User $su Already Exist"
	#	continue
		else
		echo "###The User $su Added Successfully"
		fi
echo "Done"
done
