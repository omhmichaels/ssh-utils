#!/bin/bash
# Title: fix-ssh.sh
# Author: Michael Martin
# Desc: Script to quickly fix issues with macosx ssh configurations. Ensures key usage by ssh agent

# Keyname is the only required arguement path is ~/.ssh
key=${1:- "PLEASE_ADD_THE_CORRECT_KEY_PATH/NAME"}


# Delete keys in agent
ssh-add -D;

# Add key to use to agent
echo "Adding key $key"
ssh-add $key

#
ssh-add -L 