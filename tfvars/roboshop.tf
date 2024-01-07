

resource "aws_instance" "TF_name" { 
    for_each = var.instance_name
  ami           = data.aws_ami.centos8.id
  instance_type = each.value 
  tags = {
    Name = each.key 
  }

}

resource "aws_route53_record" "www" {
  for_each = aws_instance.TF_name
  zone_id = var.zone_id
  name    = "${each.key}.${var.domain_name}" #Interpolation
  type    = "A"
  ttl     = 1
  allow_overwrite = true #To overwrite the records
  records = [startswith(each.key, "Web") ? each.value.public_ip : each.value.private_ip ] #Conditions in terraform 
}


#Commands to execute
#terraform init --help we can see -backend-config option
#terraform init -backend-config=dev/backend.tf
#terraform plan -var-file=dev/dev.tfvars
#terraform apply -var-file=dev/dev.tfvars
#terraform destroy -var-file=dev/dev.tfvars

#If we want to run the commands to prod env use -reconfigure and rest commands are same.we should always re initalize while switchng the env.
#terraform init -reconfigure -backend-config=dev/backend.tf
