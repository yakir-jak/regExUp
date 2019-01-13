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
PS3="choose what you want to do :"

#####
# 
#  TO DO : 
#          *PUT COMMANDS !!! 
#
####


## create select menue for the user

echo "choos how you want to open user :"
select m in "list_from_file" "single_user" "exit"
do
## set case	
	case $m in
## set the list_from_file option	
		list_from_file)	

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
			done ;;

## set the single_user_option
			
	
		single_user)

#single_user(){
		#	select g in develop qa devops managment 
		#	do
				echo "choose name of user :"
				read u
				echo "choose password"
				read p
				echo "choose Gorup"
				read g
				     sudo adduser $u -p $p -g $g
		#	done	
				if [ $? == 1 ];then
				echo "the user $u added seccessfuly !"
				elif [ $? == 9 ];then
       				echo  "the user $u is already exist !"
				else echo "there's a problem"
				fi
				;;
		 
		exit)
			exit
			;;

	esac
done

#singel_user 
