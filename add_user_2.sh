#/bin/bash

###########################################################################################
#
# Created By : Yakir BST
# Purpose : Create User From A list
# Date : Wed Jan  9 01:27:18 IST 2019
# Version : 0.0.1
#
###########################################################################################

###Vars  /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
name_of_file=f
name_of_user=u
password=p
# goup_name=g
list_from_file=list
single_user=su
index=i
menue=m
PS3="choose what you want to do : [1] [2] [3]"

###############################################FUNCS


###this function ask from user for a file (a hole path) and create users from.

f_file(){
			echo "Choose a file u want to create users"
			read f
			for i in $( sort $f );
			do
				sudo useradd $i
							## open statement by exit status
				if [ $? == 9 ];then
				echo "The user $i is already exist !"
				elif [ $? == 1 ];then	
				echo "the user $i added successfuly !"
				else 	echo "there's some problem !"
				fi
				sleep 1
			done 

		}



#f_file


###this function ask the user for a single user name and realitive groupe

f_user(){

echo "choose name :"
read u
echo "choose group :"
read g

sudo useradd $u -g $g


	if [ $? == 0 ];then
		sudo passwd $u && echo "the user $u added seccessfuly !" 
	elif [ $? == 9 ];then
		echo  "the user $u is already exist !"
	elif [ $? == 6 ];then
		echo "the groupe $g not exist !"
	fi



}

#f_user


########################################################MAIN

## create select menue for the user

echo "choos how you want to open user :"
select m in "list_from_file" "single_user" "exit"
do
## set case	
	case $m in
## set the list_from_file option	
		list_from_file)	f_file ;;


## set the single_user_option
			
	
		single_user) f_user ;;



		exit)
			exit
			;;

	esac
done

#singel_user 
