locals {
  vpc_id            = aws_vpc.myvpc.id
  route_table_id    = aws_route_table.subnet.id
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.mysg.id
}
