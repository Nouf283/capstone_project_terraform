terraform {
  backend "s3" {
    bucket         = "noufa-capstone-tf-state-ap-southeast-1"
    key            = "kubeadm/terraform.tfstate"
    region         = "ap-southeast-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
