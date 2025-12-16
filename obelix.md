# 7T_RF_serverUsage
**7T RF research facility server usage**

**Storinator:** 272 Terabyte Raids for storage

## Access to Storinator/Obelix
When working outside of RF Lab networks, VPN connect to MRRC-RADIOLOGY-USERS-NetworkConnect. 
When working within the RF lab networks, VPN connection is not necessary.

Connect to Storinator: ```ssh username@10.227.23.137```

Connect to Obelix interactive session: 
```
ssh username@10.227.23.139
interactive.py -c 2 -p workstation -u 1
salloc -c 64 -p cluster -k -w node10
``` 
alternatively
```
ssh username@136.142.190.89 
ssh cluster
interactive.py -c 2 -p workstation -u 1
``` 

## Jupyter Lab
Jupyter lab is a powerful tool for visulization and gives direct feedback when building basic deep learning models
install jupyter lab within the desired conda environment
```
conda install -c conda-forge jupyterlab
```
After installing jupyter lab you should call the following command: 
```
jupyter lab --no-browser --ip=0.0.0.0
```
You should see a line that looks like
```
[I 2022-05-18 13:41:46.434 ServerApp] http://obelix:8888/lab?token=.......
```
To start working on the requested jupyter session you need to call the following command in your terminal. 
```
ssh -L 8889:obelix:8888 username@136.142.190.91
```
This will connect port 8889 on your computer to port 8888 on the GPU node allowing you to connect to the Jupyter lab instance.
Then you should be able to type in ```localhost:8889``` in your browser to connect to the jupyterlab session. 
You may be asked to enter a token which will be the random letters and numbers following the ```http://obelix:8888/lab?token=``` you will also be able to assign a password which I recommend for convenience

## Visual Studio Code
While jupyter lab is illustrative to use at first, VS Code is a better option when actually training the final model with better code organization. 
To start working remotely using VS Code one can use VS Code ssh plug-ins 

## Cluster interactive.py
```interactive.py -c 2 -p workstation -u 1``` is requesting 2 cores and 1 GPU on the workstation.
