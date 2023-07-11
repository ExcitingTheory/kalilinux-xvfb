#!/bin/bash

# The following was referenced from here: https://unix.stackexchange.com/questions/69314/automated-ssh-keygen-without-passphrase-how
ssh-keygen -b 2048 -t rsa -f ~/.ssh/id_rsa -q -N ""
cat ~/.ssh/id_rsa >> ~/.ssh/authorized_keys
