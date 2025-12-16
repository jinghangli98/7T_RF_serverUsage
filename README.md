# 7T_RF_serverUsage
**7T RF research facility server usage**


**Storinator:** 272 Terabyte Raids for storage

**Pitt CRC:**  Cluster: smp, Available SUs: 1700000 | Cluster: mpi, Available SUs: 50000 | Cluster: gpu, Available SUs: 50000 | Cluster: htc, Available SUs: 500000 

## 
[rflab cluster](https://github.com/jinghangli98/7T_RF_serverUsage/blob/main/obelix.md) 

[CRC](https://github.com/jinghangli98/7T_RF_serverUsage/blob/main/crc.md)

## Useful crc script
```crc-quota``` This command shows how much disk storage you have left.

```crc-usage``` This command shows how much computational resources you have used.

```crc-idel``` This command shows the idle computational resources. 

```squeue -u username --cluster gpu``` This command shows you the jobs that you are running on the gpu cluster. 

#### CPU interactive request
> ```crc-interactive -s -b 12``` 
> 
> 
> These command will request resources on the smp cluster with 12 gb memory. **Note: htc is slower than smp.** But fewer people request htc and you could get resources allocated faster than smp if you want more cores.  To leverage the amount of cores requested you could use the ```parallel``` GNU command.
> 
> Example: ```ls *.nii | parallel --jobs 4 mri_synthstrip -i {} -m {.}_mask.nii``` This command will list out all the nii files in your current directory and process skull stripping using mri_synthstrip 4 jobs at a time. 

#### GPU interactive request
> ```crc-interactive -g -p a100 -b 40 -t 6``` This commands will request a100 gpu 40 gb memory for 6 hours. To see available computational resources, you could use ```crc-idel```. 
