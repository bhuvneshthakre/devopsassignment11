# Create the VPC
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

# Create the security group for the private DB instance
resource "aws_security_group" "private_db_sg" {
  name_prefix = "private-db-sg-"
  vpc_id = aws_vpc.main.id

  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = ["10.0.1.0/24"] # Replace with your desired IP range
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
