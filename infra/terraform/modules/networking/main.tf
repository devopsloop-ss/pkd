resource "aws_vpc" "main" {
    cidr_block  =   "10.0.0.0/16"
    tags    =   {
        Name    =   "pkd vpc"
    }
}

resource "aws_subnet" "public_subnet" {
    vpc_id  = aws_vpc.main.id
    cidr_block  = "10.0.1.0/20"
    map_public_ip_on_launch =   true
    tags    =   {
        Name    =   "Public Subnet"
    }
}


resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.main.id

    tags = {
        Name = "pkd-igw"
    }
}

resource "aws_route_table" "public_rt" {
    vpc_id = aws_vpc.main.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }

    tags = {
        Name = "pkd-public_rt"
    }
}