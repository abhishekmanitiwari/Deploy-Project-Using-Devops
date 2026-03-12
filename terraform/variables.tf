variable "region" {
  default = "ap-south-1"
}

variable "public_key" {
  description = "Public SSH Key"
  type        = string
}

variable "private_key" {
  description = "Private SSH Key"
  type        = string
  sensitive   = true
}

variable "key_name" {
  description = "Key pair name"
  type        = string
}