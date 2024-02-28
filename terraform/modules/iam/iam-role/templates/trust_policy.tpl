{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
       "${trusted_entity_type}": 
          ${trusted_entity_arn}
          
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
