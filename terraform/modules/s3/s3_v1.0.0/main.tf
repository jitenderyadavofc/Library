
resource "aws_s3_bucket" "main" {
    provider = aws.account_prod

    for_each = var.s3_buckets
    bucket = each.value.bucket_name
    force_destroy = each.value.force_destroy

    
    tags=merge(
    {"Name"=each.value.bucket_name},
    {
     for tag_key, tag_value in var.tags:
        tag_key=>tag_value  
     })
}