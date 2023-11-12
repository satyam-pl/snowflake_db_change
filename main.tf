terraform {
  required_providers {
    snowflake = {
      source  = "chanzuckerberg/snowflake"
      version = "0.25.17"
    }
  }

  backend "remote" {
    organization = "satyam-patel-trident"

    workspaces {
      name = "gh-actions-demo"
    }
  }
}

provider "snowflake" {
  account  = "oc31534.ap-south-1" # the Snowflake account identifier
  username = "pspundir"
  password = "Htek@#123"
  role     = "ACCOUNTADMIN"
  region = "ap-south-1.aws"
}


resource "snowflake_database" "demo_db" {
  name    = "DEMO_DB"
  comment = "Database for Snowflake Terraform demo by satyam patel"
}
