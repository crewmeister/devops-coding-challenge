provider "kubernetes" {
  config_path = "/home/runner/.kube/config"
  config_context = "minikube"
}

output "helm_release_name" {
  value = helm_release.crewmeister_app.name
}