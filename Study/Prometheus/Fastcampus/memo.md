# Prometheus 소개

- Metric 수집
  - push 방식
    - 어플리케이션 내부에서 API 로직 필요
    - or 어플리케이션 마다 에이전트가 필요
    - Coupling metric backend system
    - Require (agent | logic) per application
  - pull 방식
    - Monitoring 시스템 자체가 주체가됨
    - 타겟을 명시 (서비스 디스커버리 필요)
    - 모니터링 시스템 내에서 설정
    - Require service discovery
    - **Easy to update setting**


