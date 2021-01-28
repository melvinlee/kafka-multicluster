KAFKA_NS1= cluster-1
KAFKA_NS2= cluster-2
KAFKA_C3_NS= cluster-c3
INGRESS_NS= ingress

.PHONY: helm-update
helm-update:
	#################################################################
	# Enable confluent repo
	#################################################################
	helm repo add confluentinc https://confluentinc.github.io/cp-helm-charts/
	helm repo update

.PHONY: create-ns
create-ns:
	kubectl create ns $(KAFKA_NS1)
	kubectl create ns $(KAFKA_NS2)
	kubectl create ns $(KAFKA_C3_NS)
	kubectl create ns $(INGRESS_NS)
	
.PHONY: deploy-kafka1
deploy-kafka1:
	#################################################################
	# Deploy Kafka Enterprise Cluster 1
	#################################################################
	#
	kubectl config set-context --current --namespace=$(KAFKA_NS1)
	helm upgrade --install -f kafka-1.yaml k1 confluentinc/cp-helm-charts

.PHONY: deploy-kafka2
deploy-kafka2:
	#################################################################
	# Deploy Kafka Enterprise Cluster 2
	#################################################################
	#
	kubectl config set-context --current --namespace=$(KAFKA_NS2)
	helm upgrade --install -f kafka-2.yaml k2 confluentinc/cp-helm-charts

.PHONY: deploy-c3
deploy-c3:
	#################################################################
	# Deploy Kafka Control Center
	#################################################################
	kubectl config set-context --current --namespace=$(KAFKA_C3_NS)
	helm upgrade --install -f kafka-c3.yaml c3 confluentinc/cp-helm-charts
	kubectl apply -f c3-ingress.yaml

.PHONY: deploy-nginx
deploy-nginx:
	#################################################################
	# Deploy nginx
	#################################################################
	kubectl config set-context --current --namespace=$(INGRESS_NS)
	helm upgrade --install nginx stable/nginx-ingress