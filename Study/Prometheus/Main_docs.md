# Main_docs

- 페이지 생성일: 2023.02.23

<br>

## Features
- a multi-dimensional data model with time series data identified by metric name and key/value pairs
- PromQL, a flexible query language to leverage this dimensionality
- no reliance on distributed storage; single server nodes are autonomous
- time series collection happens via a pull model over HTTP
- pushing time series is supported via an intermediary gateway
- targets are discovered via service discovery or static configuration
- multiple modes of graphing and dashboarding support

<br>

## Component

- Exporter(pull), Push gateway(push) 를 통해 수집
- 수집된 모든 정보(메트릭)를 로컬(TSDB)에 저장
- 규칙(rule)을 수행하여 시계열 형태의 데이터로 수집
- 특정 조건에 설정된 경고(alert) 발생

<br>

- 프로메테우스를 데이터 소스로 사용하는 경우, 수집할 대상에 따라 익스포터를 선택
- 지원되는 API 클라이언트 (a.k.a Grafana)를 사용하여, 수집한 데이터를 PromQL을 통해, 원하는 조건에 맞는 데이터 시각화


## Point!

- 노드 익스포터는 모니터링 대상 시스템에 설치 (?, 검증중)