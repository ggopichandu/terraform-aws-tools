module "jenkins" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 5.0"

  name = "jenkins-tf"

  instance_type = "t3.small"
  vpc_security_group_ids = ["sg-09884a3929b4c7a4c"]
  subnet_id     = "subnet-0546bcf98efcaa4a4"
  ami           = data.aws_ami.ami_info.id
  user_data = file("jenkins.sh")
  tags = {
        Name = "jenkins-tf"
    }
}

module "jenkins-agent" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 5.0"

  name = "jenkins-agent"

  instance_type = "t3.small"
  vpc_security_group_ids = ["sg-09884a3929b4c7a4c"]
  subnet_id     = "subnet-0546bcf98efcaa4a4"
  ami           = data.aws_ami.ami_info.id
  user_data = file("jenkins-agent.sh")
  tags = {
        Name = "jenkins-agent"
    }
}

module "records" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  version = "~> 3.0"

  zone_name = var.zone_name

  records = [
    {
      name    = "jenkins"
      type    = "A"
      ttl =      1
      records = [
        module.jenkins.public_ip
      ]
    },
    {
      name    = "jenkins-agent"
      type    = "A"
      ttl =      1
      records = [
        module.jenkins-agent.private_ip
      ]
    }    
  ]
}
