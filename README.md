# elasticsearch-on-k8s

## Usage

#### create `elasticsearch-on-k8s` Project & GKE cluster on GCP
- If you don't have GCP project or terraform see [Before you begin](https://www.terraform.io/docs/providers/google/getting_started.html#before-you-begin)

```
cd terraform/gcp
terraform init
terraform apply
```

#### create Namespaces
- get credentials
```
gcloud container clusters get-credentials [cluster name] --zone [your zone] --project [project id]

# example
# gcloud container clusters get-credentials elasticsearch --zone asia-northeast1-a --project elasticseatch-on-k8s 
```

- apply namespaces.yaml

```
# apply
kubectl apply -f namespaces.yaml

# check namespaces
kubectl get namespaces
NAME                 STATUS    AGE
default              Active    21h
dev-elasticsearch    Active    7s  <- applied
kube-public          Active    21h
kube-system          Active    21h
test-elasticsearch   Active    6s  <- applied
```

#### push docker image to Container Registry

```
gcloud components install docker-credential-gcr
gcloud auth configure-docker
```

```
cd elasticsearch
docker build -t gcr.io/elasticsearch-on-k8s-sample/elasticsearch6:6.3 .
docker tag [IMAGE ID] gcr.io/elasticsearch-on-k8s-sample/elasticsearch6:6.3 
docker push gcr.io/elasticsearch-on-k8s-sample/elasticsearch6:6.3
```
