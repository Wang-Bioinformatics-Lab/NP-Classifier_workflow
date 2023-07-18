# NP-Classifier Nextflow

To test the workflow simply do

```
make run [-e input_file=<input_file>]
```

If you do not specify an input file, by default it will take the sample file located in [data/test_input.tsv](data/test_input.tsv)

To learn NextFlow checkout this documentation:

https://www.nextflow.io/docs/latest/index.html

## Parameters in nextflow 

The parameters in nextflow follow the next priority:

i. Parameters specified on the command line (--something value)
ii. Parameters provided using the -params-file option
iii. Config file specified using the -c my_config option
iv. The config file named nextflow.config in the current directory
v. The config file named nextflow.config in the workflow project directory
vi. The config file $HOME/.nextflow/config
vii. Values defined within the pipeline script itself (e.g. main.nf)

In case you wish to set your parameters directly in nextflow, please use the next syntaxis:


```
nextflow [options] ./nf_workflow.nf [--input="$(input_file)"] [additional args...]
```

## Run in a conda environment

To run the workflow in a conda environment, there is a configuration file [conda_env.yml](bin/conda_env.yml). This file configured the environment named np-classifier-env. It can be created and activated by:

```
conda env create -f bin/conda_env.yml
conda activate np-classifier-env
```

and then the workflow can be executed from the conda environment. If you do not specify an input file, by default it will take the sample file located in [data/test_input.tsv](data/test_input.tsv).

```
nextflow [options] ./nf_workflow.nf [--input="$(input_file)"] [additional args...]
```

## Deployment in GNPS2

Check [https://github.com/Wang-Bioinformatics-Lab/Nextflow_Workflow_Template](Nexftlow template instructions from Mingxun Wang)
