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
      name = "your-workspace-name"
    }
  }
}

provider "snowflake" {
  account  = "oc31534"
  username = "pspundir"
  password = "Htek@#123"
  role     = "ACCOUNTADMIN"
  region   = "ap-south-1"
}

resource "snowflake_database" "demo_db" {
  name    = "DEMO_DB"
  comment = "Database for Snowflake Terraform demo"
}
