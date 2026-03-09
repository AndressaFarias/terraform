terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket = "drevops-descomplicando-terraform"
    key    = "linuxtips/aula_import"
    region = "us-east-1"

  }
}

# Configure the AWS Provider
# esse que não possui um alias, é considerado o provider default
provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  alias = "west"
  region = "us-east-2"
}



