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
  region = "ap-south-1"
}

resource "snowflake_database" "demo_db" {
  name    = "DEMO_DB"
  comment = "Database for Snowflake Terraform demo"
}
