
variable "policy_name" {
  description = "policy name for Athenix project"
  type = string
}

variable "policy_actions" {
 description = "rpolicy actions for IAM role"
  type = list(string)
}

variable "policy_effect" {
  description = "policy effect allow/deny"
  type = string
}

variable "policy_resources" {
  description = "resources arn for IAM policy Athenix project"
  type = list(string)
}


variable "tags" {
  description = "role name for Athenix project"
  type = map(string)
  
}