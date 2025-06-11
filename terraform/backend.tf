terraform {
  backend "s3" {
    bucket = "terraformcicds3"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
