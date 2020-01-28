apiVersion: v1
kind: Service
metadata:
  name: ${serviceName}
spec:
  ports:
    - port: 8080
      name: http
  selector:
    app: ${serviceName}
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: ${serviceName}
  labels:
    app: ${serviceName}
spec:
  replicas: 1
  selector:
    matchLabels:
      app: ${serviceName}
  template:
    metadata:
      labels:
        app: ${serviceName}
    spec:
      containers:
        - name: ${serviceName}
          image: ${serviceName}
          ports:
            - containerPort: 8080
