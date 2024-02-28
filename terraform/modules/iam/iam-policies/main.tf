
resource "aws_iam_policy" "iam_policy" {
   #    provider = aws.account_prod
   name = var.policy_name

   policy = templatefile("${path.module}/templates/custom_role_policy.tpl", 
                       {
                         effect=var.policy_effect
                         actions=jsonencode(var.policy_actions)
                         role_arn=jsonencode(var.policy_resources)
                        })

   tags=merge(
    {"Name"=var.policy_name},
    {
     for tag_key, tag_value in var.tags:
        tag_key=>tag_value  
     })                     
}
