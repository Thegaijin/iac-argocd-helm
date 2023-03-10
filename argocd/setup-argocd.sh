#!/usr/bin/env bash

set -e

kubectl apply -f namespace.yaml
# kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl apply -n argocd -f deployment.yaml
kubectl apply -f nginx-ingress-controller.yaml
# solve Internal error occurred: failed calling webhook "validate.nginx.ingress.kubernetes.io"
kubectl delete -A ValidatingWebhookConfiguration ingress-nginx-admission
kubectl apply -n argocd -f ingress.yaml
