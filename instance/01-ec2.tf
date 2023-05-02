data "terraform_remote_state" "remote_state" {
  backend = "remote"

  config = {
    organization = "KAL_DevOps_PoC"
    workspaces = {
      name = "terraform-remote-state-vpc"
    }
  }
}

output "remote_state_output" {
  value       = data.terraform_remote_state.remote_state
  description = "remote_state_output"
}

resource "aws_security_group" "resource-tagging-lab-kthong" {
  name = var.aws_kthong_sg_name
  vpc_id = data.terraform_remote_state.remote_state.outputs.output_vpc_kthong.id
}

resource "aws_instance" "ec2_kthong" {
  ami                    = "ami-0d9f286195031c3d9"
  instance_type          = "t2.micro"
  subnet_id              = data.terraform_remote_state.remote_state.outputs.output_aws_subnet_public_2a_kthong.id
  vpc_security_group_ids = [aws_security_group.resource-tagging-lab-kthong.id]
}

output "ec2_kthong_public_ip" {
  value       = aws_instance.ec2_kthong.public_ip
  description = "The public IP of the Instance"
}

output "ec2_kthong_public_dns" {
  value       = aws_instance.ec2_kthong.public_dns
  description = "The Public dns of the Instance"
}

output "ec2_kthong_private_ip" {
  value       = aws_instance.ec2_kthong.private_ip
  description = "The Private_ip of the Instance"
}