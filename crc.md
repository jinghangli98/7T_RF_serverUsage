
## Access to CRC
When working outside of Pitt networks, VPN connect to MRRC-RADIOLOGY-USERS-NetworkConnect. 
When working within the Pitt networks, VPN connection is not necessary.

Connect to Pitt CRC: ```ssh username@h2p.crc.pitt.edu```

Connect to crc interactive session: 
```
crc-interactive --smp --time=10 --num-cores=4
```
This command will request 1 hour and two cores on smp cluster.
```
crc-interactive -g -u 1 -n 1 -c 1 -p a100 -t 6
``` 
This command will request 6 hours on A100 gpu on the crc cluster

 See ``` crc-interactive.py --help``` for more options
 

```
module load pytorch_gpu/1.11.0
```
This command will load the gpu version of pytorch

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
[I 2022-11-03 11:55:08.427 ServerApp] http://login0.crc.pitt.edu:8888/lab?token=.......
```
To start working on the requested jupyter session you need to call the following command in your terminal. 
```
ssh -L 8889:login0.crc.pitt.edu:8888 username@h2p.crc.pitt.edu
```
This will connect port 8889 on your computer to port 8888 on the GPU node allowing you to connect to the Jupyter lab instance.
Then you should be able to type in ```localhost:8889``` in your browser to connect to the jupyterlab session. 
You may be asked to enter a token which will be the random letters and numbers following the ```http://login0.crc.pitt.edu:8888/lab?token=``` you will also be able to assign a password which I recommend for convenience

## Visual Studio Code
While jupyter lab is illustrative to use at first, VS Code is a better option when actually training the final model with better code organization. 
To start working remotely using VS Code one can use VS Code ssh plug-ins 

## Sbatch job submission 
```sbatch freesurfer_seg.sh``` [freesurfer_seg.sh](https://github.com/jinghangli98/7T_RF_serverUsage/blob/main/freesurfer_seg.sh)

```sbatch --array=1-72 freesurfer_seg.sh``` [freesurfer_seg.sh](https://github.com/jinghangli98/7T_RF_serverUsage/blob/main/freesurfer_seg.sh) This command will submit 72 jobs

## Useful Link
https://burntyellow.github.io
