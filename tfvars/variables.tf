
variable "instance_name" {
    type = map
    default = {
        #MongoDB = "t3.small" As we are already passing it in "dev/prod.tfvars".
        #Web = "t2.micro"
       

        }  
}

variable "zone_id" {
   default = "Z01932751K3CM859RKY5G"  #Replace with your zone ID
}

variable "domain_name" {
    default = "haripalepu.cloud"  #Replace with your Domain name 
  
}