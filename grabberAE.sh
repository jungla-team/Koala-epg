#!/bin/bash
wget http://tropical.jungle-team.online/tvheadend/grabberAE.tar
tar xvf /storage/grabberAE.tar -C /
rm -f /storage/grabberAE.tar
systemctl restart tvheadend


