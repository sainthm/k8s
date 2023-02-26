# 헬름 차트 추가

```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

helm repo update
```

# 헬름차트 설치

```bash
helm install -n [namespace] [RELEASE_NAME] prometheus-community/kube-prometheus-stack
```

