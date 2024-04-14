#!/bin/bash
cd /home/ubuntu/aceweb/
sudo ./eventos.sh
cp /home/ubuntu/acestrap/github/channels.txt channels.txt
cp /home/ubuntu/channels2.txt channels2.txt
python3 githubweb.py
