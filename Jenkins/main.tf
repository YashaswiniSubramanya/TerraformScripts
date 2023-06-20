provider "aws" {
  region = var.region
}

resource "aws_instance" "Jenkins_instance" {
    ami = var.ami
    instance_type = "t2.micro"
    #key_name = var.key_name
    tags = {
      Name = "Jenkins_instance"
    }  
    user_data = "${file("jenkins.sh")}"
    security_groups = [aws_security_group.Jenkins_sg.name] 
}

resource "aws_security_group" "Jenkins_sg" {
   name = "JenkinsSg"
   ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
   }

   ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
   }

   egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
   } 
}