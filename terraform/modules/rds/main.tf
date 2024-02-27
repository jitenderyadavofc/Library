

resource "aws_rds_cluster" "rds_cluster" {

    cluster_identifier = var.cluster_identifier
    engine = var.db_engine
    engine_mode = var.engine_mode
    engine_version = var.engine_version
 

    database_name = var.db_name
    master_username = var.master_username
    master_password = var.master_password

    db_subnet_group_name = aws_db_subnet_group.db_subnet_group.name

    deletion_protection = var.deletion_protection
    backup_retention_period = var.backup_retention_period
    skip_final_snapshot = var.skip_final_snapshot


    serverlessv2_scaling_configuration {
      max_capacity = var.max_scale_capacity
      min_capacity = var.min_scale_capacity
    }
  
  tags=merge(
    {"Name"=var.cluster_identifier},
    {
     for tag_key, tag_value in var.tags:
        tag_key=>tag_value  
     })

     depends_on = [ aws_db_subnet_group.db_subnet_group ]
}


resource "aws_rds_cluster_instance" "rds_cluster_instance" {
    for_each = { for instance in var.rds_cluster_instances : instance.instance_identifier => instance }
      
      identifier = each.value.instance_identifier
      cluster_identifier = aws_rds_cluster.rds_cluster.id
      instance_class = each.value.instance_class

      engine = aws_rds_cluster.rds_cluster.engine
      engine_version = aws_rds_cluster.rds_cluster.engine_version

      publicly_accessible = each.value.publicly_accessible

   depends_on = [ aws_rds_cluster.rds_cluster ]
}

resource "aws_db_subnet_group" "db_subnet_group" {
   name = "${var.cluster_identifier}-db-subnet-group"

   subnet_ids = var.subnet_ids
 
    tags=merge(
    {"Name"="${var.cluster_identifier}-db-subnet-group"},
    {
     for tag_key, tag_value in var.tags:
        tag_key=>tag_value  
     }) 

}