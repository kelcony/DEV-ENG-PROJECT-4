# creating variabe for the aws infrastural on Terraform.

variable "Prod-rock-VPC-cidr" {
  type        = string
  description = "name of  vpc cidr"
  default     = "10.0.0.0/16"
}

variable "public-subnet1-cidr" {
  type        = string
  description = "name of  public subnet1 cidr"
  default     = "10.0.5.0/24"
}


variable "public-subnet2-cidr" {
  type        = string
  description = "name of  public subnet2 cidr"
  default     = "10.0.6.0/24"
}


variable "private-subnet1-cidr" {
  type        = string
  description = "name of  private subnet1 cidr"
  default     = "10.0.7.0/24"
}


variable "private-subnet2-cidr" {
  type        = string
  description = "name of  private subnet2 cidr"
  default     = "10.0.8.0/24"
}


variable "AZ1" {
  type        = string
  description = "name of avaliability zone"
  default     = "eu-west-2a"
}


variable "AZ2" {
  type        = string
  description = "name of avaliability zone"
  default     = "eu-west-2b"
}


variable "AZ3" {
  type        = string
  description = "name of avaliability zone"
  default     = "eu-west-2c"
}


variable "AZ4" {
  type        = string
  description = "name of avaliability zone"
  default     = "eu-west-2a"
}


variable "Region" {
  type        = string
  description = "name of Region"
  default     = "eu-west-2"
}



variable "internet-gateway-cidr" {
  type        = string
  description = "name of internet-gateway cidr "
  default     = "0.0.0.0/0"

}

