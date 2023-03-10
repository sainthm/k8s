# Set up cross-region metrics collection for Amazon Managed Service for Prometheus workspaces

- 페이지 생성일: 2023.03.09

<br>

### Main URL:

- [AWS Open Source Blog](https://aws.amazon.com/ko/blogs/opensource/set-up-cross-region-metrics-collection-for-amazon-managed-service-for-prometheus-workspaces/)


## 요약:

- 프로메테우스 셋업 관련은 이전 블로그 참고
  - 링크: [Getting Started with Amazon Managed Service for Prometheus](https://aws.amazon.com/ko/blogs/mt/getting-started-amazon-managed-service-for-prometheus/)
- 가이드는 리전도 다른 경우의 상황

<br>

## Steps involved in the setup:

- Create Amazon Managed Service for Prometheus workspace in Region Y.
- Set up an Amazon Virtual Private Cloud (Amazon VPC) endpoint on Region Y.
- Create an Amazon EKS cluster in Region X.
- Set up an Amazon VPC peering connection between VPCs on Region X and Region Y.
- Configure Amazon Route 53 to resolve requests to Amazon Managed Service for Prometheus workspace to be routed through the VPC endpoint.
- Deploy Prometheus server on the Amazon EKS cluster and configure remote write to Amazon Managed Service for Prometheus ingestion endpoint.
- Create Amazon Managed Grafana workspace in Region Z and query metrics from Amazon Managed Service for Prometheus workspace in Region Y.


<br>
