resource "aws_ecrpublic_repository" "flask-demo" {
  repository_name                 = "flask-demo"
  
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