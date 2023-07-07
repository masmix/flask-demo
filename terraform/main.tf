provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}

resource "aws_ecrpublic_repository" "flask-demo" {
  repository_name                 = "flask-demo"
  provider = aws.us_east_1
}

resource "aws_ecr_registry_scanning_configuration" "configuration" {
  scan_type = "ENHANCED"

  rule {
    scan_frequency = "CONTINUOUS_SCAN"
    repository_filter {
      filter      = "example"
      filter_type = "WILDCARD"
    }
  }
}