provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "kubernetes_namespace" "crewmeister" {
  metadata {
    name = var.namespace
  }
}

resource "helm_release" "crewmeister_app" {
  name      = "crewmeister-app"
  namespace = var.namespace
  chart     = "./crewmeister-app"

  set {
    name  = "env[0].name"
    value = "SPRING_DATASOURCE_URL"
  }

  set {
    name  = "env[0].value"
    value = "jdbc:mysql://mysql.${var.namespace}.svc.cluster.local:3306/challenge?createDatabaseIfNotExist=true"
  }

  set {
    name  = "env[1].name"
    value = "SPRING_DATASOURCE_USERNAME"
  }

  set {
    name  = "env[1].value"
    value = "app_user"
  }

  set {
    name  = "env[2].name"
    value = "SPRING_DATASOURCE_PASSWORD"
  }

  set {
    name  = "env[2].value"
    value = "app_password"
  }
}