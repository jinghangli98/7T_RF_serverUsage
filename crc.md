
## Access to CRC
When working outside of Pitt networks, VPN connect to MRRC-RADIOLOGY-USERS-NetworkConnect. 
When working within the Pitt networks, VPN connection is not necessary.

Connect to Storinator: ```ssh username@h2p.crc.pitt.edu```

Connect to crc interactive session: 
```
crc-interactive.py --smp --time=1 --num-cores=2
``` 
This command will request 1 hour and two cores on smp cluster. See ``` crc-interactive.py --help``` for more options

## Jupyter Lab on CRC 
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

## Useful Link
https://burntyellow.github.io
