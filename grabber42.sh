#!/bin/bash
wget http://tropical.jungle-team.online/tvheadend/grabber42.tar
tar xvf /storage/grabber42.tar -C /
systemctl restart service.tvheadend42


