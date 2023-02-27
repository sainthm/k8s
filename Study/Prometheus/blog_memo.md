# 프로메테우스 헬름 설치 와 오퍼레이터

<br>

# 프로메테우스 with 헬름

<br>

## 헬름 차트 추가

```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

helm repo update
```

<br>

## 헬름 차트 확인

```bash
helm show values prometheus-community/kube-prometheus-stack
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

## 헬름 설정

- pv, ingress 설정

<br>

### sample yaml

```yaml
prometheus:
  prometheusSpec:
    storageSpec:
      volumeClaimTemplate:
        spec:
          accessModes: ["ReadWriteOnce"]
          resources:
            requests:
              storage: 5Gi
            selector:
              matchLabels:
                app: ds-prometheus
```

### pv.yaml (Example)

```yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: prometheus-pv
  labels:
    app: prometheus-test
spec:
  capacity:
    storage: 20Gi
  accessModes:
    - ReadWriteOnce
  hostPath:
    path: "/mnt/prometheus"
  volumeMode: Filesystem
```

<br>

### ingress_override_values.yaml

```yaml
prometheus:
  # change here
  prometheusSpec:
    routePrefix: /prom
    storageSpec:
      volumeClaimTemplate:
        spec:
          accessModes: ["ReadWriteOnce"]
          resources:
            requests:
              storage: 5Gi
          selector:
            matchLabels:
              app: prometheus-test
  ### ingress 쪽은 수정 필요!!
  #ingress:
    #enabled: true
    # change here
    #hosts:
      #- choilab.com
    # change here
    #paths:
      #- /prom
      
grafana:
  adminPassword: password1234
  ingress:
    enabled: true
    annotations:
      nginx.ingress.kubernetes.io/rewrite-target: /$2
    # change here
    path: /test(/|$)(.*)
    ### hosts 설정 수정 필요
    #hosts:
      #- choilab.com
  ### grafana.ini 설정 수정 필요 
  #grafana.ini:
    #server:
      # change here
      #domain: choilab.com
      #root_url: http://choilab/test/
      #serve_from_sub_path: true
```


## ingress 설정

<br>

### sample yaml

```yaml
prometheus:
  proemtheusSpec:
    routePrefix: /prom
  ingress:
    enabled: true
    hosts:
      - sample.com
    paths:
      - /prom
```

<br>

## 헬름 설치

```bash
# ns 가 없다면 생성 진행
kubectl create ns prometheus
```

<br>

```bash
# pv 생성 진행
# stack 자체에서 pv가 정의되어 있으므로 먼저 생성
kubectl apply -f pv.yaml
```

<br>


```bash
# recap for helm install
helm install -n [namespace] -f specific_file [RELEASE_NAME] prometheus-community/kube-prometheus-stack
```

<br>

```bash
# 헬름 설치 진행
helm install -n prometheus -f ingress_override_values.yaml preometheus-stack prometheus-community/kube-prometheus-stack
```

<br>

## 헬름 설치 확인

```bash
kubectl get pod -n prometheus
```

<br>

# Operator

<br>

## 프로메테우스 오퍼레이터

<br>

### 역할

- 오퍼레이터가 변화를 감지하고 프로메테우스 서버에 반영

<br>

### 설정 정보:

- [kube-prometheus-stack 공식링크](https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack)
- Developing Prometheus Rules and Grafana Dashboards 참조
  - prometheus.io/scrape