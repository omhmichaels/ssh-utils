#!/bin/bash
KEYNAME=$1

 ssh-keygen -t rsa -b 4096 -C $KEYNAME