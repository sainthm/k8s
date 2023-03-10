# Prometheus directory

## 프로메테우스 관련 학습 내용 정리 폴더

- 폴더 생성일: 2023.02.22

<br>

## 프로메테우스 컴포넌트

- Prometheus server
  - Retrieval: pull 메트릭을 통해, 메트릭을 가져옴
    - **Prometheus targets**
    - PushGateway
  - TSDB
  - HTTP server


<br>

## 쿠버네티스 오퍼레이터
- 헬름을 통해 관리하는 포인트 세 가지!!
  - Retrieval
  - pull metrics
  - Prometheus targets (Jobs/exporters)

<br>

## 프로메테우스 헬름 차트 구성

- 아래의 컴포넌트들이 pod에 배포
  - sts: Prometheus server, Alertmanager
  - deploy: Grafana, operator, kube-metrics
  - crd: servicemonitor (operator 가 직접적으로 사용)
  - cm
  - secret
  - svc
  - ing


<br>

## 프로메테우스 헬름 차트 설치

#### 헬름 차트 추가

```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
```

<br>

#### 헬름 차트 설치

```bash
helm install -n [namespace] [RELEASE_NAME] prometheus-community/kube-prometheus-stack
```

<br>

<br>