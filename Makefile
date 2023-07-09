input_file=data/test_input.tsv

clean:
	rm -Rf .nextflow* work bin/__pycache__

run:
	nextflow run ./nf_workflow.nf --input="$(input_file)" --resume -c nextflow.config

run_hpcc:
	nextflow run ./nf_workflow.nf --input="$(input_file)" --resume -c nextflow_hpcc.config

# 
run_docker:
	nextflow run ./nf_workflow.nf --input="$(input_file)" --resume -with-docker <CONTAINER NAME>

# The tasks for the NP-Classifier are performed using small python scripts and web services requests, therefore a docker instance does not make sense
#run_docker: