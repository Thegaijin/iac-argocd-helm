#!/usr/bin/env bash

set -e

kubectl apply -f namespace.yaml
# https://kubernetes.github.io/ingress-nginx/deploy/#digital-ocean
# downloaded from https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl apply -n argocd -f deployment.yaml
# downloaded from https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.44.0/deploy/static/provider/do/deploy.yaml
# Added annotations per this issue https://github.com/kubernetes/ingress-nginx/issues/8965
kubectl apply -f nginx-ingress-controller.yaml
kubectl apply -n argocd -f secret.yaml  # set github credentials for access to private repos
kubectl apply -n argocd -f ingress.yaml # Add argocd ingress
