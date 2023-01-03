input_file=data/test_input.tsv

run:
	nextflow run ./nf_workflow.nf --input="$(input_file)" --resume 

# The tasks for the NP-Classifier are performed using small python scripts and web services requests, therefore a docker instance does not make sense
#run_docker:
#	nextflow run ./nf_workflow.nf --resume -with-docker <CONTAINER NAME>