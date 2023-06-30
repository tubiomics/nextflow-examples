nextflow.enable.dsl=2


process TASK_MEMORY {
  memory = 8.GB

  input:

  output:
  
  script:
  def avail_mem = 2048
  if (!task.memory) {
    log.info 'Memory not known - defaulting to 2GB. Specify process memory requirements using a nextflow.config file.'
  } else {
    avail_mem = (task.memory.mega*0.8).intValue()
    log.info("Running with jvm memory option: -Xmx${avail_mem}M")
  }
  """
  echo -Xmx${avail_mem}M
  """
}

workflow {

  TASK_MEMORY()
}