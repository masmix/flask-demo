
#!/bin/bash

read -p "ECR URI : " ECR_URI
echo "ECR_URI: $ECR_URI"

docker tag flask-demo:2.0.0 $ECR_URI:2.0.0
docker tag flask-demo:2.0.1 $ECR_URI:2.0.1
docker tag flask-demo:2.0.2 $ECR_URI:2.0.2

docker push $ECR_URI:2.0.0
docker push $ECR_URI:2.0.1
docker push $ECR_URI:2.0.2