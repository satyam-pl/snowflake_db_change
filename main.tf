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
  account  = env("SNOWFLAKE_ACCOUNT")
  username = env("SNOWFLAKE_USER")
  password = env("SNOWFLAKE_PASSWORD")
  region   = env("SNOWFLAKE_REGION")
}

resource "snowflake_database" "demo_db" {
  name    = "DEMO_DB"
  comment = "Database for Snowflake Terraform demo by satyam patel"
}
