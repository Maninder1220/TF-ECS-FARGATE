
# # # # # SECURITY GROUP # # # # # 
resource "aws_security_group" "sg" {
  vpc_id = var.vpc_id
  name = "Channeling Traffic"
  description = "This security group allow inbound and outbound traffic for ssh, http and https on port 22 , 80 and 443 respectively."

  tags = {
    Name = "${var.belongs_to}-Security-Group"
  }
}


# Security Group Rules INGRESS
resource "aws_security_group_rule" "In_icmp" {
    type = "ingress"
    cidr_blocks = ["0.0.0.0/0"]
    protocol =  "icmp"
    from_port =  -1
    to_port =  -1
    security_group_id = aws_security_group.sg.id
}


resource "aws_security_group_rule" "in_ssh" {
    type = "ingress"
    cidr_blocks = ["0.0.0.0/0"]
    protocol = "tcp"
    from_port = 22
    to_port = 22
    security_group_id = aws_security_group.sg.id
}

resource "aws_security_group_rule" "in_http" {
    type = "ingress"
    cidr_blocks = ["0.0.0.0/0"]
    protocol = "tcp"
    from_port = 80
    to_port = 80
    security_group_id = aws_security_group.sg.id
}

resource "aws_security_group_rule" "in_https" {
    type = "ingress"
    cidr_blocks = ["0.0.0.0/0"]
    protocol =  "tcp"
    from_port =  443
    to_port =  443
    security_group_id = aws_security_group.sg.id
}


# Security Group Rules EGRESS
resource "aws_security_group_rule" "eg_icmp" {
    type = "egress"
    cidr_blocks = ["0.0.0.0/0"]
    protocol =  "icmp"
    from_port =  -1
    to_port =  -1
    security_group_id = aws_security_group.sg.id
}


resource "aws_security_group_rule" "eg_ssh" {
    type = "egress"
    cidr_blocks = ["0.0.0.0/0"]
    protocol = "tcp"
    from_port = 22
    to_port = 22
    security_group_id = aws_security_group.sg.id
}

resource "aws_security_group_rule" "eg_http" {
    type = "egress"
    cidr_blocks = ["0.0.0.0/0"]
    protocol = "tcp"
    from_port = 80
    to_port = 80
    security_group_id = aws_security_group.sg.id
}

resource "aws_security_group_rule" "eg_https" {
    type = "egress"
    cidr_blocks = ["0.0.0.0/0"]
    protocol =  "tcp"
    from_port =  443
    to_port =  443
    security_group_id = aws_security_group.sg.id
}

