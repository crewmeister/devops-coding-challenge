terraform {
  backend "s3" {
    bucket = "crewmeisterbucket"
    key    = "helm-deploy-state/terraform.tfstate"
    region = "eu-central-1"
  }
}
