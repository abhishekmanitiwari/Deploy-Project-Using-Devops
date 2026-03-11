resource "aws_iam_instance_profile" "ec2_profile"{
    name = "ec2_profile"
    role = "EC2-ReadOnly-Access"
}

resource "aws_instance" "name" {
  ami           = "ami-019715e0d74f695be"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.main_group.id]
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name
  tags = {
    Name = "DeployVM"
  }

  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ubuntu"
    private_key = var.private_key
    timeout     = "4m"
  }
}

resource "aws_key_pair" "deployer" {
  key_name   = var.key_name
  public_key = var.public_key
}

resource "aws_security_group" "main_group" {
  name        = "main-security-group"
  description = "Allow SSH and HTTP access"

  ingress =[
    {
    description = "SSH Access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },
  ingress {
    description = "HTTP Access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
]
  egress = [
    {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ]
}