#!/bin/bash
set -e

IMAGE_NAME="my-csv-app"
IMAGE_TAG="latest"
FULL_IMAGE="$IMAGE_NAME:$IMAGE_TAG"
ENV_FILE=".env"
NAMESPACE="case"
eval $(minikube docker-env)
docker images

echo "🚀 1. Docker image build ediliyor..."
docker build --no-cache -t $FULL_IMAGE .
echo "✅ Docker image build tamamlandı."

# Kubernetes namespace kontrol
kubectl get namespace $NAMESPACE &>/dev/null || kubectl apply -f k8s/namespace.yaml

echo "🚀 2. PostgreSQL deploy ediliyor..."
kubectl apply -f k8s/namespace.yaml -n $NAMESPACE
kubectl apply -f k8s/postgres/ -n $NAMESPACE


echo "⏳ PostgreSQL Pod hazır olana kadar bekleniyor..."
kubectl wait --for=condition=ready pod -l app=postgres -n $NAMESPACE --timeout=120s

echo "🚀 3. Python uygulaması deploy ediliyor..."
kubectl apply -f k8s/python-app-pod.yaml -n $NAMESPACE

echo "⏳ python-csv-app Pod hazır olana kadar bekleniyor..."
kubectl wait --for=condition=ready pod/python-csv-app -n case --timeout=120s

echo "📄 Python Pod logları:"
kubectl logs -f python-csv-app -n $NAMESPACE
