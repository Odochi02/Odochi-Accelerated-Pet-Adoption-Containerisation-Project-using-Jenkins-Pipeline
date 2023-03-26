terraform {

  backend "s3" {

    bucket         = "oapacpujp-backend"
    key            = "OAPACPUJP/stage/compute/terraform.tfstate"
    region         = "eu-west-2"
    profile        = "Odochi"
    dynamodb_table = "OAPACPUJP_dynamo_table"

  }

}