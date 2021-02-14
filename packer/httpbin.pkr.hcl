variable "region" {
  type    = string
  default = "eu-west-3"
}

locals { timestamp = regex_replace(timestamp(), "[- TZ:]", "") }

source "amazon-ebs" "httpbin" {
  ami_name      = "http-bin-exercise-${local.timestamp}"
  instance_type = "t2.micro"
  region        = "${var.region}"
  tags          = {
    application = "httpbin"
  }
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/*ubuntu-focal-20.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }
  ssh_username = "ubuntu"
}

build {
  sources = ["source.amazon-ebs.httpbin"]
  provisioner "ansible" {
    playbook_file = "./ansible/httpbin.yml"
  }
}

