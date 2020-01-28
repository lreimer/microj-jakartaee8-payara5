apiVersion: skaffold/v2alpha1
kind: Config
metadata:
  name: ${serviceName}
build:
  tagPolicy:
    sha256: {}
  artifacts:
  - image: ${serviceName}
    jib: {}
deploy:
  kubectl:
    manifests:
    - kubernetes/microservice.yaml
portForward:
  - resourceType: service
    resourceName: ${serviceName}
    namespace: default
    port: 8080
    localPort: 8080
profiles:
  - name: development
    activation:
      - kubeContext: docker-desktop
