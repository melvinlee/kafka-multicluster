# Kafka Multi Cluster

## Quickstart

### Initialise helm repo

```sh
make helm-update
```

### Deploy Control Center and Nginx Ingress Controller
```sh
make deploy-c3 deploy-nginx
```

### Deploy Kafka Cluster 1 and Kafka Cluster 2
```sh
make deploy-kafka1 deploy-kafka2
```

## Cleanup
```sh
make clean-up
```