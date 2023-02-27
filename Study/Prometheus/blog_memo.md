# 프로메테우스 헬름 설치 와 오퍼레이터

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
