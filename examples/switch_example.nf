nextflow.enable.dsl=2

params.annotate_analysis_type = null

process TASK_A {
  input:
  
  output:
  
  script:
  """
  echo Running task A
  """
}

process TASK_B  {
  input:
  
  output:
  
  script:
  """
  echo Running Task B
  """
}

workflow {
	main:
    switch ( params.annotate_analysis_type ) {
      case "TASK_A":
        log.info("Running TASK_A")
        TASK_A()
        break
      case "TASK_B":
        log.info("Running TASK_B")
        TASK_B()
        break
      case "all":
        log.info("Running tasks: [TASK_A, TASK_B]")
        TASK_A()
        TASK_B()
        break
      default:
          log.warn("annotate_analysis_type is unknown, defaulting to all and running both analysis.");
          TASK_A()
          TASK_B()
          break
  }
}