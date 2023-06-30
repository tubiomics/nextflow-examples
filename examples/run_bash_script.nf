nextflow.enable.dsl=2

process binDirExample {
    input:
    val str

    script:
    """
    my_script.sh ${str}
    """
}

workflow {
    Channel.of('this', 'that') | binDirExample
}
