output "instance_ip_address" {
    value = aws_instance.Jenkins_instance.public_ip 
}