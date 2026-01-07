locals{
    ami_id = data.aws_ami.joindevops.id
    sonar_ami_id = data.aws_ami.sonarqube.id
}