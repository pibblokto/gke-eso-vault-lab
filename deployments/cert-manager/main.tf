resource "null_resource" "apply_cert_manager" {
  provisioner "local-exec" {
    command = "kubectl apply -f ${local.cert_manager_manifest_url}"
  }
}
resource "kubectl_manifest" "cluster_issuer" {
    depends_on = [ null_resource.apply_cert_manager ]
    yaml_body = <<EOF
apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
  name: le-cluster-issuer
spec:
  acme:
    email: mock-email@mock.com
    server: https://acme-v02.api.letsencrypt.org/directory
    privateKeySecretRef:
      name: letsencrypt-prod
    solvers:
      - http01:
          ingress:
            class: nginx
EOF
}
