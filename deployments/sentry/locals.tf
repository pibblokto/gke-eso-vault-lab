locals {
    repository    = "https://sentry-kubernetes.github.io/charts"
    release_name  = "sentry"
    namespace     = "sentry"
    chart         = "sentry"
    chart_version = "26.14.1"
    values        = []
    values_file   = [<<EOF
user:
  create: true
  email: ""
  password: ""

ingress:
  enabled: true
  # If you are using traefik ingress controller, switch this to 'traefik'
  regexPathStyle: nginx
  annotations:
  # If you are using nginx ingress controller, please use at least those 2 annotations
    kubernetes.io/ingress.class: nginx
    nginx.ingress.kubernetes.io/use-regex: "true"
    cert-manager.io/cluster-issuer: le-cluster-issuer

  hostname: sentry.mukinabaht.com

sentry:
  singleOrganization: false
  worker:
    replicas: 1

service:
  name: sentry
  type: ClusterIP
  externalPort: 9000
  annotations: {}

postgresql:
  enabled: false
## This value is only used when postgresql.enabled is set to false
##
externalPostgresql:
  host: pg-cluster-rw
  port: 5432
  username: postgres
  password: "uvDLxAd8FBRMzuuV8KV2Q9hZheYpeVsB3UQsWjcrfq4gJiT7YBmZnpdVv5kjc35x"
  database: app
EOF
  ]
}
