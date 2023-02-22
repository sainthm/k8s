# Resource metric pipeline

- k8s 환경에서 Metrics API 는 AutoScaling 및 비슷한 사용 사례를 지원하기 위한 기본적인 메트릭 집합을 제공
- 해당 API는 노드와 파드의 리소스 사용량 정보를 제공 (CPU, Mem 지표 포함)
- Metrics API 를 통해, k8s API 클라이언트는 이러한 사용량 정보를 질의 가능
- 이러한 질의를 위해, k8s 접근 제어 방식을 이용

