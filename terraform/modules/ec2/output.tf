output "public_ip" {
  value = aws_instance.Athenix[2].public_ip
}

output "ebs_volume" {
  value = aws_ebs_volume.Athenix
}

