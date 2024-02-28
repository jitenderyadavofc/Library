# AWS S3

Module to create S3 bucket

## Usage

### One S3 bucket with versioning enabled

```hcl
module "s3_bucket_versioned" {
  source = "<REPO_PATH>/terraform/aws/s3"

  bucket_name = "<name_of_the_bucket>"

  versioning = {
    enabled = true
  }

  tags = "<map_of_tags>
}
```

### Multiple S3 buckets with versioning enabled

```hcl
module "s3_bucket_versioned" {
  count = length(<map_of_bucket_info>)
  source = "<REPO_PATH>/terraform/aws/s3"

  bucket_name = "<name_of_the_bucket> + count.index"

  versioning = {
    enabled = true
  }
  
  tags = "<map_of_tags>
}
```

## Arguments supported
| Name | Description |
|------|-------------|
| bucket_name | Name prefix for the bucket |
| tags | A map of tags |