#/bin/bash

###########################################################################################
#
# Created By : Yakir BST
# Purpose : Add Users From List
# Date : Sat Jan  5 21:38:05 IST 2019
# Version : 0.0.1
#
###########################################################################################

###In the Script the user have 2 options to creat users. it can be a dingle user or a prepered list. (text file with names)
echo "Select how you want to Add User : "
###Start in a simle Select menu 
select OP in "Single_User" "Choose_From_List" ; 
do
###Print the picked option
echo " you chose $OP " 
sleep 1 
###Statement in case for list
	if [ $OP == "$Choose_From_List" ];then
	echo "choose your List"
###Asking the user for a name of a file
	read User_List
###Open a for loop for the chosen list
	
		for u in $( cat $User_List );
		do
		sudo useradd $u;
			if [ $? == 9 ];then
###Exit status 9 means the user existing
###Print if the NEW user already exist or successfully created
			echo "###User $u Already Exist###"
			continue
			else 
			echo "###The User $u  Added Successfully###"
###Ending Statement
			fi		
		sleep 1

		done
###Open A New Statemant fot "Single_User" option

	if [ $OP == "Single_User" ];then
###Asking from the user to type the name of the NEW user
	echo "Type the name of the new user :"
	read Singel_User

	useradd $Single_User
	fi
		if [ $? == 9 ];then
		echo "###The User $Single_User Already Exist"
		continue
		else
		echo "###The User $Singel_User Added Successfully"
		fi
echo "Done"
done
