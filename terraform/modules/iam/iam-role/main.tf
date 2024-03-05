
resource "aws_iam_role" "iam_role" {
#    provider = aws.account_prod

   name = var.role_name

   assume_role_policy = templatefile("${path.module}/templates/trust_policy.tpl", 
                       {
                         trusted_entity_type=var.trusted_entity_type
                         trusted_entity_arn=jsonencode(var.trusted_entity_arn)
                        })

   tags=merge(
    {"Name"=var.role_name},
    {
     for tag_key, tag_value in var.tags:
        tag_key=>tag_value  
     })                     
}


resource "aws_iam_role_policy_attachment" "iam_policy_attachment" {
    # provider = aws.account_prod

    for_each = toset([for policy_arn in var.managed_policies:
                  "arn:aws:iam::aws:policy/${policy_arn}" ])
    role = aws_iam_role.iam_role.name
    policy_arn = each.value

    depends_on = [ aws_iam_role.iam_role ]
}
