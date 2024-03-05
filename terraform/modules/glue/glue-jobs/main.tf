
resource "aws_glue_job" "glue_job" {

    name = var.glue_job_name
    role_arn = var.glue_role_arn
    max_capacity = var.max_capacity
    glue_version = var.glue_version


    command {
      name = var.command_name
      script_location = var.job_script_location
    }

    tags=merge(
    {"Name"=var.glue_job_name},
    {
     for tag_key, tag_value in var.tags:
        tag_key=>tag_value  
     })   
  
}