# docker_CRI

- **Docker CRI**(Container Runtime Interface)는 Docker Engine과 클러스터 컨트롤러(예: Kubernetes) 간의 상호작용을 정의하는 인터페이스!!
- CRI는 Docker Engine이 컨테이너를 실행하고 관리하는 방식을 표준화하여 Kubernetes 등의 클러스터 관리 솔루션에서 Docker Engine을 사용할 수 있도록 함!! 
- CRI는 Kubernetes v1.5부터 기본적으로 지원되며, Kubernetes와 Docker Engine 간의 통신을 간소화하여 컨테이너 관리 및 배포를 더욱 쉽게 할 수 있도록 도움!!