#!/bin/bash
ssh-keygen -b 2048 -t rsa -f ~/.ssh/id_rsa -q -N ""
cat ~/.ssh/id_rsa >> ~/.ssh/authorized_keys