# Golang websever deployment to aws fargate

### Login to ecr
```bash
    aws ecr get-login-password --region ap-southeast-1 | docker login --username AWS --password-stdin <your-ecr-registry-url>
```

### Tag container
```bash
    docker tag go-web-app:slim <your-ecr-registry-url>/go-web-app
```

### Push to ECR
```bash
    docker push <your-ecr-registry-url>/golang_webapp
```