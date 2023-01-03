nextflow.enable.dsl=2

params.input = "data/test_input.tsv"
params.publishdir = "./nf_output"


// Workflow Boiler Plate
params.OMETALINKING_YAML = "flow_filelinking.yaml"
params.OMETAPARAM_YAML = "job_parameters.yaml"

TOOL_FOLDER = "$baseDir/bin"

process classifyMolecules {
    publishDir "$params.publishdir", mode: 'copy', overwrite: false

    input:
    path query
    

    output:
    path "output.tsv"

    """
    python $TOOL_FOLDER/npclassify.py $query output.tsv
    """
}

process drawResults {
    publishDir "$params.publishdir", mode: 'copy', overwrite: false

    input:
    path query

    output:
    path "drawing.html"

    """
    python $TOOL_FOLDER/drawclassification.py $query drawing.html
    """
}

workflow{
    Channel.fromPath(params.input) | classifyMolecules | drawResults
}