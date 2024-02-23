
variable "s3_buckets" {
  description = "bucket lists for Athenix project"
  type = map(object({
    bucket_name = string
    force_destroy=bool
  }))
}

variable "tags" {
  type = map(string)
  description = "this is custom tags used for aws resources."
}