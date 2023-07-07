resource "aws_ecrpublic_repository" "flask-demo" {
  name                 = "flask-demo"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
  
}