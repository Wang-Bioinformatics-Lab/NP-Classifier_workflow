nextflow.enable.dsl=2

params.input = "data/test_input.tsv"

// Workflow Boiler Plate
params.OMETALINKING_YAML = "flow_filelinking.yaml"
params.OMETAPARAM_YAML = "job_parameters.yaml"

TOOL_FOLDER = "$baseDir/bin"

process classifyMolecules {
    publishDir "./nf_output", mode: 'copy', overwrite: false
    conda "$TOOL_FOLDER/conda_env.yml"
    input:
    path query
    

    output:
    path "output.tsv"

    """
    python $TOOL_FOLDER/npclassify.py $query output.tsv
    """
}

process drawResults {
    publishDir "./nf_output", mode: 'copy', overwrite: false
    conda "$TOOL_FOLDER/conda_env.yml"
    input:
    path classifiedMolecules

    output:
    path "drawing.html"

    """
    python $TOOL_FOLDER/drawclassification.py $classifiedMolecules drawing.html
    """
}

workflow{
    Channel.fromPath(params.input) | classifyMolecules | drawResults
}