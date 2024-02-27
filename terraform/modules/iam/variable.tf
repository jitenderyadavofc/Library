
variable "role_name" {
  description = "role name for Athenix project"
  type = string
}

variable "trusted_entity_type" {
  description = "trusted entity type of Principle in trust policy AWS/Service"
  type = string
}

variable "trusted_entity_arn" {
  description = "trusted entity arn for IAM assume role"
  type = list(string)
}


variable "managed_policies" {
   description = "managed policies for IAM  role"
  type = list(string)
}

variable "tags" {
  description = "role name for Athenix project"
  type = map(string)
  
}