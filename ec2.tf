resource "aws_instance" "server1" {
  ami           = "ami-0ef2d359f6067387c"
  instance_type = "t2.micro"
  #security_groups = [aws_security_group.sg-demo.id]
  vpc_security_group_ids = [ aws_security_group.sg-demo.id ]
  key_name      = aws_key_pair.aws_key.key_name
  user_data     = file("server.sh")
  subnet_id = aws_subnet.public1.id
  tags ={
    Name = "utc-app-inst"
  }
}
