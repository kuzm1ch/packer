#!/bin/sh

NOT_READY=`sudo docker node ls | grep --invert-match Leader | grep --invert-match Ready | awk 'FNR > 1 {print $2}'`

for HOSTNAME in $NOT_READY; do
#they will be terminated if stopped
aws ec2 stop-instances --instance-ids `aws ec2  describe-instances  --filters "Name=tag:Environment,Values=dev" | grep $HOSTNAME | awk '{print $8; exit}'`  || true
sudo docker node rm $HOSTNAME
done
