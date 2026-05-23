terraform {
  required_version = ">= 1.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# CloudFront exige us-east-1 para certificados ACM (usamos o padrão da CF aqui)
provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}
