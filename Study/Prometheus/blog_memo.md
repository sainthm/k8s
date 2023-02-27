# 프로메테우스 헬름 설치 와 오퍼레이터

<br>

## 헬름 차트 추가

```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

helm repo update
```

<br>

## 헬름차트 설치

```bash
helm install -n [namespace] [RELEASE_NAME] prometheus-community/kube-prometheus-stack
```

<br>

## 헬름차트 values.yaml 추출

```
helm show values prometheus-community/kube-prometheus-stack > /tmp/override_values.yaml
```

