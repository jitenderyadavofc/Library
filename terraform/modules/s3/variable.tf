
variable "bucket_name" {
  description = "bucket name for Athenix project"
  type = string
}

variable "tags" {
  type = map(string)
  description = "this is custom tags used for aws resources."
}