
resource "aws_glue_catalog_database" "glue_catalog_db" {

    name = var.catalog_db_name

    location_uri = var.data_location


    tags=merge(
    {"Name"=var.catalog_db_name},
    {
     for tag_key, tag_value in var.tags:
        tag_key=>tag_value  
     })   
  
}

resource "aws_glue_crawler" "glue_crawler" {

    database_name = aws_glue_catalog_database.glue_catalog_db.name
    name = var.crawler_name
    role = var.glue_role_arn


    s3_target {
      path = var.data_location
    }

     tags=merge(
    {"Name"=var.crawler_name},
    {
     for tag_key, tag_value in var.tags:
        tag_key=>tag_value  
     })   
  
   depends_on = [ aws_glue_catalog_database.glue_catalog_db ]
}


