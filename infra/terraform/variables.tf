variable "aws_region" {
    type = string
    default = "ap-south-1"
}

variable "profile" {
    type = string
    default = "default"
}

variable "credentials" {
    type = string
    default = "$HOME/.aws/credentials"
}