
resource "aws_instance" "Terraform_Ec2" {  #Terraform_Ec2 name is for terraform reference
  ami           = "ami-03265a0778a880afb" #devops-practice ami
  instance_type = lookup(var.instance_type, terraform.workspace)
  #vpc_security_group_ids = [aws_security_group.SampleSG.id]

  tags = {
    Name = "TerraformEc2" #Ec2 Instance name 
  }
}