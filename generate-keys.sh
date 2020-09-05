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

# Loop through and generate keys
items=`echo  ${host_list} | wc -w`

for ((i=1;i<${items};i++))
do
    printf "\nPROCESSING ITEM: $i\n"
    user=$(echo $user_list | cut -d' ' -f$i)
    host=$(echo $host_list | cut -d' ' -f$i)
    KEYNAME="${host}-${user}"

    printf "HOST:\n\t$host\n"
    printf "USER:\n\t$user\n"
    
    printf "\nKEYNAME:\n\t $KEYNAME\n"
    printf "\nCREATING SSH KEY:\n\t $KEYNAME\n"
    ssh-keygen -t rsa -b 4096 -P "${GOODIES}" -f ~/.ssh/$KEYNAME && echo "${GOODIES}" >&1 ssh-add  -K ~/.ssh/$KEYNAME ;

    printf "\nAdding key to keychain\n"
    #echo ${GOODIES} | ssh-add  -K ~/.ssh/$KEYNAME 

    printf "\nFINISHED: \n\tUser: $user\n\tKey: $KEYNAME.\n----------\n"


   
done

printf "\n\n------------------\nKEYS IN SSH-AGENT:\n"
ssh-add -L

printf "\n\n------------------\nSSH KEYS:\n"
ls -a ~/.ssh
printf "\nFINISHED\n"
