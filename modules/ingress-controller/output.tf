output "nginx_ingress_status" {
  value = helm_release.nginx_ingress.status
  description = "Full status of the NGINX Ingress Controller Helm Release"
}
