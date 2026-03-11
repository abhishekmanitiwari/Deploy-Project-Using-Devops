output "instance_public_id"{
   value = aws_instance.server.public_ip
   sensitive = true
}