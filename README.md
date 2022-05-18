# 7T_RF_serverUsage
7T RF research facility server usage

## Access to Storinator/Obelix
VPN connect to MRRC-RADIOLOGY-USERS-NetworkConnect

Connect to storinator: ```ssh 136.142.190.89```

Obelix interactive session: 
```
ssh 136.142.190.91 
interactive.py -c 2 -p workstation -u 1
``` 
or
```
ssh 136.142.190.89 
ssh cluster
interactive.py -c 2 -p workstation -u 1
``` 
