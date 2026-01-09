locals{
    ami_id = data.aws_ami.joindevops.id
    nexus_ami_info = data.aws_ami.nexus_ami_info.id
}