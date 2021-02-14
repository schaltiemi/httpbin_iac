data "aws_ami" "image" {
  most_recent = true
  owners      = ["self"]
  filter {
    name   = "tag:application"
    values = ["httpbin"]
  }
}