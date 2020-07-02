#!/bin/bash
wget http://tropical.jungle-team.online/tvheadend/grabber43.tar
tar xvf /storage/grabber43.tar -C /
rm -f /storage/grabber43.tar
systemctl restart service.tvheadend43


