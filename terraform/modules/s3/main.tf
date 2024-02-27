resource "aws_s3_bucket" "main" {
   #  provider = aws.account_prod

    bucket = var.bucket_name
   
    tags=merge(
    {"Name"=var.bucket_name},
    {
     for tag_key, tag_value in var.tags:
        tag_key=>tag_value  
     })
}

output "bucket_id" {
   value = aws_s3_bucket.main.id
}