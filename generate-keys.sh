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
hosts=$(echo $host_list | xargs echo)  
# Strip remaining quotes
users=$(echo "${user_list}" | xargs echo) 


echo HOSTS: $host_list
echo USERS: $user_list
# Loop through and generate keys
IFS=$' '
while read host;
do
    printf "INDEX: $index"
    printf "\nACCOUNT:  $host\n"
    printf "\nUSER:  ${user_list[$index]}\n"

    KEYNAME="${host}-${user[$index]}"
    
    printf "\nKEYNAME: $KEYNAME\n"
    printf "\nCREATING SSH KEY  $KEYNAME\n"
    #ssh-keygen -t rsa -b 4096 -P $GOODIES -f "~/.ssh/$KEYNAME"

    printf "\nAdding key to keychain\n"
    #(echo $GOODIES) | ssh-add -K ~/.ssh/$KEYNAME
    index=$(index + 1)
done
unset IFS
printf "\nFINISHED GENERATING SSH KEYS.\n"
 