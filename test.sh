#!/bin/bash
# Title: generate-keys.sh

CONFIG=${1:- "~/.ssh/accounts.json"}
printf "\nPLEASE ENTER A PASSWORD FOR SSH KEYS:\n";
read -s GOODIES;


# Use jq to get host from json config
host_list=$(jq '.[] | .host ' ${CONFIG}) 

# Use jq to get users from json config
user_list=$(jq '.[] | .user ' ${CONFIG}) 

# Strip remaining quotes
host_list=$(echo $host_list | xargs echo)  
# Strip remaining quotes
user_list=$(echo "${user_list}" | xargs echo) 

IFS=$' '
# Loop through and generate keys
items=`echo  ${host_list} | wc -w`

count=0
for ((i=0;i<${items};i++))
do
    echo $count 
    echo ${user_list[$i]};
    echo ${host_list[$i]};
    echo finished loop
    count=($count+1)
done

unset IFS
printf "\nFINISHED GENERATING SSH KEYS.\n"
 
