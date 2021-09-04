#!/bin/bash
dt=$(date '+%d/%m/%Y %H:%M:%S');

#chmod 600 /root/.ssh/id_rsa
#chmod 600 /root/.ssh/config
#chown -R root:root /root/.ssh

echo "$dt"
echo 'start tunnelssh.sh'
#check ssh
ssh ${TUNNEL_USER}@${TUNNEL_HOST} -p ${TUNNEL_PORT}
#add server to known_hosts
#ssh-keyscan -t rsa -p ${TUNNEL_PORT} ${TUNNEL_HOST}  >> /root/.ssh/known_hosts 
#oracle dev
autossh -f -N -L 0.0.0.0:1516:172.19.2.16:1521 ${TUNNEL_USER}@${TUNNEL_HOST} -p ${TUNNEL_PORT}

#show process in log
ps -aux
#keep alive
echo 'tail -f /dev/null'
tail -f /dev/null