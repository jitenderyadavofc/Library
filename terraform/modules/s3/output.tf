
output "s3_buckets" {                                                   # for getting bucket ids
   value = aws_s3_bucket.main[*].id
   description = "for getting s3 buckets ids"
}