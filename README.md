# elasticsearch-on-k8s

## Usage

### GCP
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
# gcloud container clusters get-credentials elasticsearch --zone asia-northeast1-a --project elasticsearch-on-k8s-sample
```

- apply namespaces.yaml

```
# apply
kubectl apply -f namespaces.yaml

# check namespaces
kubectl get namespaces
NAME            STATUS    AGE
default         Active    2m
elasticsearch   Active    11s <- applied
kube-public     Active    2m
kube-system     Active    2m
```

#### push docker image to Container Registry

```
gcloud components install docker-credential-gcr
gcloud auth configure-docker
```

```
cd elasticsearch
docker build -t gcr.io/elasticsearch-on-k8s-sample/elasticsearch6:6.3 .
docker push gcr.io/elasticsearch-on-k8s-sample/elasticsearch6:6.3
```

#### create ES Master
```
kubectl apply -f es-master-svc.yaml --namespace=elasticsearch
kubectl apply -f es-master.yaml --namespace=elasticsearch
```