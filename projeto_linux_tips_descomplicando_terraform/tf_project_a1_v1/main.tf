
#    1 - provider : define o provider que será usados;

provider "aws" {
  region  = "us-east-1"
  version = "~> 2.0"
}


/*
  2 - terraform : não possui tipo
      backend   : para salvar o estado no S3;
*/

terraform {
/* 
  Esse bloco determina que o arquivo tfstate seja salvo na aws
  para que o arquivo seja salvo localmente é só excluir esse bloco 
*/
  backend "s3" {
    bucket = "farias-labs-lt-descomplicando-tf"
    key    = "a1/v1/terraform.tfstate"
    region = "us-east-1"  // deve ser a mesma região que o bucket foi criado
  }
}