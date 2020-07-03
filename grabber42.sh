#!/bin/bash
curl -o grabber42.tar http://tropical.jungle-team.online/tvheadend/grabber42.tar
tar xvf /storage/grabber42.tar -C /
rm -f /storage/grabber42.tar
systemctl restart service.tvheadend42


