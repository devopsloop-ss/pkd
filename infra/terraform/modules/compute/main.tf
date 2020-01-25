#AMI selection data source
data "aws_ami" "ubuntu" {
    most_recent = true
    filter {
        name = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
    }

    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }

    owners = ["099720109477"] # Canonical
}

#Master instance
resource "aws_instance" "master" {
    ami           = data.aws_ami.ubuntu.id
    instance_type = "t3.micro"
    key_name  =   "sos2"
    subnet_id =   var.public_subnet_id
    iam_instance_profile    =  var.master_profile
    vpc_security_group_ids  =   [var.open_sg_id]

    root_block_device   {
        volume_size = 20
    }

    tags = {
        Name = "master"
    }
}

#Node instance
resource "aws_instance" "node" {
    ami           = data.aws_ami.ubuntu.id
    instance_type = "t3.micro"
    key_name  =   "sos2"
    subnet_id =   var.public_subnet_id
    iam_instance_profile    =   var.node_profile
    vpc_security_group_ids  =   [var.open_sg_id]

    root_block_device   {
        volume_size = 20
    }

    tags = {
        Name = "node"
    }
}