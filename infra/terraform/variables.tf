variable "aws_region" {
    type = string
    default = "us-east-1"
}

variable "profile" {
    type = string
    default = "default"
}

variable "credentials" {
    type = string
    default = "$HOME/.aws/credentials"
}