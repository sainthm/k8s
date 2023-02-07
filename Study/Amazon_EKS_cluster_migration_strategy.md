# Blue/Green, Canary 방법을 활용한 stateless 워크로드의 Amazon EKS 클러스터 마이그레이션 전략

<br>

### Source URL: [Link](https://aws.amazon.com/ko/blogs/tech/blue-green-or-canary-amazon-eks-clusters-migration-for-stateless-argocd-workloads/)

<br>

## Outline

- 기업은 MSA와 같은 최신 애플리케이션 개발 방식을 사용하여 혁신, 성능, 보안 및 안정성을 향상
- 이런 개발 방식에 레거시 배포 시스템을 사용하면 이슈사항 발생(배포 제어, 보안 유지, 빠른 속도 등)
- 워크로드 관리를 위하여, ECS 및 EKS 등을 활용하기도 함
- CD(Continuous Delivery) 관련 리소스들을 활용