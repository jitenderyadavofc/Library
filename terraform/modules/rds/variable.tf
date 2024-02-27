# RDS Modules variable
variable "cluster_identifier" {
  description = ""
  type        = string
}

variable "db_engine" {
  description = ""
  type        = string
}

variable "engine_mode" {
  description = ""
  type        = string
}
variable "engine_version" {
  description = ""
  type        = string
}
variable "db_name" {
  description = ""
  type        = string
}
variable "master_username" {
  description = ""
  type        = string
}
variable "master_password" {
  description = ""
  type        = string
}
variable "backup_retention_period" {
  description = ""
  type        = number
}

variable "skip_final_snapshot" {
  description = ""
  type        = bool
}



variable "subnet_ids" {
  description = ""
  type        = list(string)
}

variable "tags" {
  type = map(string)
  description = "this is custom tags used for aws resources."
}

variable "rds_cluster_instances"{
  description = "Aws rds cluster instance"

}

variable "max_scale_capacity" {
  description = "Aws rds cluster instance"
  type = number
}

variable "min_scale_capacity" {
  description = "Aws rds cluster instance"
  type = number
}

variable "deletion_protection" {  
  description = "Aws rds cluster instance"
  type = bool
  
}