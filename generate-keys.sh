#!/bin/zsh
# Title: generate-keys.sh

CONFIG=${1:- "~/.ssh/accounts.json"}
printf "\nPLEASE ENTER A PASSWORD FOR SSH KEYS:\n";
#read -s GOODIES;

# Use jq to get host from json config
host_list=$(jq '.[] | .host ' ${CONFIG}) 

# Use jq to get users from json config
user_list=$(jq '.[] | .user ' ${CONFIG}) 

# Strip remaining quotes
host_list=$(echo $host_list | xargs echo)  
# Strip remaining quotes
user_list=$(echo $user_list | xargs echo) 

echo HOSTS: $host_list
echo USERS: $user_list
# Loop through and generate keys
for host user in $(echo $host_list) $(echo $user_list);
do
 
    printf "\nACCOUNT:  $host\n"
    printf "\nUSER:  $user\n"

    KEYNAME="$host-$user"
    
    printf "\nKEYNAME: $KEYNAME\n"
    printf "\nCREATING SSH KEY FOR $user\n"
    #ssh-keygen -t rsa -b 4096 -P $GOODIES -f $KEYNAME 
done
unset IFS
printf "\nFINISHED GENERATING SSH KEYS.\n"
 