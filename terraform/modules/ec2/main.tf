resource "aws_instance" "Athenix" {
  count         = var.instance_count
  ami           = var.ami_id
  instance_type = var.instance_type
  tags = {
    Name = var.instance_names[count.index] != "" ? var.instance_names[count.index] : "instance-${count.index + 1}"

  }
  security_groups = [aws_security_group.ssh_access.name]

}

resource "aws_ebs_volume" "Athenix" {
  availability_zone = "us-east-1a"
  size              = var.ebs_volume_size
  tags = {
    Name = "Athenix-volume"
  }
}

resource "aws_security_group" "ssh_access" {
  name        = "ssh_access"
  description = "Allow SSH inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.ssh_cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
