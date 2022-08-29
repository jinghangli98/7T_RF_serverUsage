#!/bin/bash -f

#PBS -N MS_HM2
#PBS -t 1-1
#PBS -q smp 
#PBS -l mem=15gb
#PBS -m abe
#PBS -M jil202@pitt.edu
#PBS -l walltime=99:00:00
# #PBS -p 0
#PBS -l nodes=1:ppn=1

# #PBS -l procs_bitmap=0000000000001111

PERMDIR=$PBS_O_INITDIR

echo ------------------------------------------------------
echo -n 'Job is running on node '; cat $PBS_NODEFILE
echo ------------------------------------------------------
echo PBS: qsub is running on $SLURMD_NODENAME
echo PBS: working directory is $SLURM_SUBMIT_DIR
echo PBS: job identifier is $SLURM_TASK_PID
echo PBS: job name is $SLURM_JOB_NAME
echo PBS: job array identifier is $SLURM_ARRAY_TASK_ID
echo ------------------------------------------------------


echo ------------------------------------------------------
echo -n 'Job is running on node '; cat $PBS_NODEFILE
echo ------------------------------------------------------
echo ' '
echo ' '

stagein()
{
	export dummy=1
}

run_program()
{
	module load freesurfer
	SUBJECTS_DIR=$SLURM_SUBMIT_DIR
	echo SUBJECTS_DIR=$SUBJECTS_DIR
	cd $SUBJECTS_DIR
	echo $PWD
	subject_mprage=$(head -$SLURM_ARRAY_TASK_ID ADNI_T1T2_List | tail -1)
    name=$(echo $subject_mprage | cut -d/ -f2)
	echo recon-all -i ADNI1/ADNI1_data/$subject_mprage/converted/MPRAGE/MPRAGE.nii -s ${name%.nii} -sd $home/ADNI1/ADNI1_data/$subject_mprage/converted/MPRAGE -all
    recon-all -i $HOME/ADNI1/ADNI1_data/$subject_mprage/converted/MPRAGE/MPRAGE.nii -s ${name%.nii} -sd $HOME/ADNI1/ADNI1_data/$subject_mprage/converted/MPRAGE -all 
}

stageout()
{
	echo ' '

}

early()
{
	echo ' '
	echo ' ############ WARNING:  EARLY TERMINATION #############'
	echo ' '
}

trap 'early; stageout' SIGINT SIGKILL SIGTERM

stagein
run_program
stageout

exit
