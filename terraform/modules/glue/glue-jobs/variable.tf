
variable "glue_role_arn" {
  description = "Aws glue role arn"
  type        = string

}

variable "tags" {
  description = "role name for Athenix project"
  type = map(string)
  
}


variable "job_script_location" {
  description = "Aws glue crawler name"
  type        = string

}

variable "glue_job_name" {
  description = "Aws glue job name"
  type        = string

}

variable "max_capacity" {
  description = "Aws glue job max capacity DPU"
  type        = number

}

variable "command_name" {
  
}

variable "glue_version" {
  description = "Aws glue job version"
  type        = string

}


