data "aws_vpc" "default" {
  default = true
}

resource "aws_security_group" "web_sg" {
  name        = "${var.server_config.name}-sg"
  description = "Security group for web server"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    from_port   = var.network_config[2]
    to_port     = var.network_config[2]
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidr_blocks
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.instance_tags
}

resource "aws_instance" "web_server" {
  count         = var.instance_count
  ami           = "ami-0e8459476fed2e23b"
  instance_type = var.instance_type

  monitoring                  = var.enable_monitoring
  associate_public_ip_address = var.associate_public_ip

  availability_zone = tolist(var.availability_zones)[0]

  vpc_security_group_ids = [aws_security_group.web_sg.id]

  tags = merge(var.instance_tags, local.common_tags)

  root_block_device {
    volume_size = var.storage_size
    volume_type = "gp3"
  }
}