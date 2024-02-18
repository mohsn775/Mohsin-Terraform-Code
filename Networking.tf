resource "aws_subnet" "Pub-sub1" {
  vpc_id            = aws_vpc.Mohsin-VPC.id
  cidr_block        = var.public_subnet1_cidr
  availability_zone = "us-west-2a"

  tags = {
    Name = "Pub-sub1"
  }
}

resource "aws_subnet" "Pvt-Sub1" {
  vpc_id            = aws_vpc.Mohsin-VPC.id
  cidr_block        = var.private_subnet1_cidr
  availability_zone = "us-west-2a"

  tags = {
    Name = "Pvt-sub1"
  }
}
  
resource "aws_subnet" "Pub-sub2" {
  vpc_id            = aws_vpc.Mohsin-VPC.id
  cidr_block        = var.public_subnet2_cidr
  availability_zone = "us-west-2b"

  tags = {
    Name = "Pub-sub2"
  }
}

resource "aws_subnet" "Pvt-sub2" {
  vpc_id            = aws_vpc.Mohsin-VPC.id
  cidr_block        = var.private_subnet2_cidr
  availability_zone = "us-west-2b"

  tags = {
    Name = "Pvt-sub2"
  }
}


resource "aws_subnet" "Pvt-Sub3" {
  vpc_id            = aws_vpc.Mohsin-VPC.id
  cidr_block        = var.private_subnet3_cidr
  availability_zone = "us-west-2a"

  tags = {
    Name = "Pvt-sub3"
  }
}

resource "aws_route_table" "Mohsin-Pub-RT" {
  vpc_id = aws_vpc.Mohsin-VPC.id 
  route {
    cidr_block = var.Route_table_cidr
    gateway_id = "local" # Replace with your internet gateway ID
  }
  tags = {
    Name = "Mohsin-Pub-RT"
  }
}

resource "aws_route_table" "Mohsin-Pvt-RT" {
  vpc_id = aws_vpc.Mohsin-VPC.id 
  tags = {
    Name = "Mohsin-Pvt-RT"
  }
}


resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.Mohsin-VPC.id

  tags = {
    Name = "Mohsin-IGW"
  }
}

resource "aws_route_table_association" "Public1" {
  subnet_id      = aws_subnet.Pub-sub1.id
  route_table_id = aws_route_table.Mohsin-Pub-RT.id
}

resource "aws_route_table_association" "Public2" {
  subnet_id      = aws_subnet.Pub-sub2.id
  route_table_id = aws_route_table.Mohsin-Pub-RT.id
}

resource "aws_route_table_association" "Private1" {
  subnet_id      = aws_subnet.Pvt-Sub1.id
  route_table_id = aws_route_table.Mohsin-Pvt-RT.id
}

resource "aws_route_table_association" "Private2" {
  subnet_id      = aws_subnet.Pvt-sub2.id
  route_table_id = aws_route_table.Mohsin-Pvt-RT.id
}

resource "aws_route_table_association" "Private3" {
  subnet_id      = aws_subnet.Pvt-Sub3.id
  route_table_id = aws_route_table.Mohsin-Pvt-RT.id
}

resource "aws_route_table_association" "IGW" {
  gateway_id     = aws_internet_gateway.gw.id
  route_table_id = aws_route_table.Mohsin-Pub-RT.id
}

resource "aws_db_subnet_group" "my_Pub_db_subnet_group" {
  name = "my-db-subnet-group"
  subnet_ids = [aws_subnet.Pub-sub1.id, aws_subnet.Pub-sub2.id]

  tags = {
    Name = "My DB Subnet Public Group"
  }
}

resource "aws_db_subnet_group" "my_PVT_db_subnet_group" {
  name = "my-db-subnet-group"
  subnet_ids = [aws_subnet.Pvt-Sub1.id, aws_subnet.Pvt-Sub2.id]

  tags = {
    Name = "My DB Subnet Private Group"
  }
}

# Create RDS Instance with Security Group
resource "aws_security_group" "rds_security_group" {
  name        = "rds-security-group"
  description = "Allow all traffic to RDS"
  vpc_id      = aws_vpc.Mohsin-VPC.id

  ingress {
    from_port = 3306
    to_port   = 3306
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}