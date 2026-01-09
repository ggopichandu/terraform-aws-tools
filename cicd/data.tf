data "aws_ami" "joindevops" {

    most_recent = true
    owners = ["973714476881"]

    filter {
        name   = "name"
        values = ["RHEL-9-DevOps-Practice"]
    }

    filter {
        name   = "root-device-type"
        values = ["ebs"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }
}

data "aws_ami" "nexus" {

    most_recent = true
    owners = ["679593333241"]

    filter {
        name   = "name"
        values = ["SolveDevOps-Nexus-Server-Ubuntu20.04-*"]
    }

    filter {
        name   = "root-device-type"
        values = ["ebs"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}