terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.33.0"
    }
  }

  required_version = ">= 1.5.0"
}

provider "aws" {
  region = "ap-southeast-1" # change to your region
}
